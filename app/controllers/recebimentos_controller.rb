# encoding: UTF-8
class RecebimentosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    recebimento = Recebimento.new(recebimento_param)
    cobranca = recebimento.cobranca
    if cobranca
      if recebimento.save
        divida = cobranca.divida
        divida = params[:divida_cobranca] if params[:divida_cobranca]
        render json: {
          recebimento: recebimento,
          divida_cobranca: divida,
          totais: cobranca.getTotais
        }
      else
        render ::Response.object_erros(recebimento)
      end
    else
      render ::Response.not_found
    end
  end

  def destroy
    recebimento = Recebimento.where(id: params[:id]).first
    if recebimento
      if recebimento.destroy
        render json: {
          recebimento: recebimento,
          divida_cobranca: recebimento.cobranca.divida,
          totais: recebimento.cobranca.getTotais
        }
      else
        render ::Response.object_erros(recebimento)
      end
    else
      render ::Response.not_found
    end
  end

  def calcular_divida
    cobranca = Cobranca.where(id: params[:cobranca_id]).first
    juros, multa, data, valor = params.values_at(:juros, :multa, :data, :valor)
    data  = data.try(:to_date)
    valor ||= 0
    juros ||= 0
    multa ||= 0
    divida_cobranca = juros_atual = multa_atual = 0
    ultimo_recebimento = cobranca.recebimentos.last
    valor_base = cobranca.valor
    if cobranca.recebimentos.any?
      juros_atual = ultimo_recebimento.juros_atual
      multa_atual = ultimo_recebimento.multa_atual
      valor_base = ultimo_recebimento.valor_base
    end

    if data
      data_calculo = cobranca.recebimentos.any? ? ultimo_recebimento.data : cobranca.vencimento
      diferenca_data = data - data_calculo
      juros = valor_base * (cobranca.juros/100) * diferenca_data
      multa = cobranca.valor * (cobranca.multa/100) if cobranca.recebimentos.empty?
    end

    juros += juros_atual if juros_atual > 0
    multa = multa_atual if multa_atual > 0

    pagamentoMaior = 0
    if divida_cobranca < 0
      pagamentoMaior = divida_cobranca
      divida_cobranca = 0
    end

    divida_cobranca = valor_base + juros + multa - valor

    if (juros+multa) > valor
      multa_atual = multa - (valor - juros)
      if juros > valor
        juros_atual = juros - valor
        multa_atual = multa
      end
    else
      juros_atual = multa_atual = 0
      valor_base = divida_cobranca
    end

    render json: {
      juros: juros.round(2),
      multa: multa.round(2),
      divida_cobranca: divida_cobranca.round(2),
      pagamentoMaior: pagamentoMaior.round(2),
      juros_atual: juros_atual.round(2),
      multa_atual: multa_atual.round(2),
      valor_base: valor_base.round(2)
    }
  end

  protected

  def recebimento_param
    if params[:recebimento].present?
      params.require(:recebimento).permit(:valor, :juros, :multa, :data, :valor_base, :juros_atual, :multa_atual, :cobranca_id)
    else
      {}
    end
  end

end
