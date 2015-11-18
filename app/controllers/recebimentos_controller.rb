# encoding: UTF-8
class RecebimentosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    recebimento = Recebimento.new(recebimento_param)
    cobranca = recebimento.cobranca
    if cobranca
      if recebimento.save
        render json: {
          recebimento: recebimento,
          divida_cobranca: cobranca.divida,
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
    divida_cobranca = 0
    if data
      data_calculo = cobranca.recebimentos.any? ? cobranca.recebimentos.last.data : cobranca.vencimento
      divida = cobranca.divida
      diferenca_data = data - data_calculo
      juros = divida * (cobranca.juros/100) * diferenca_data if diferenca_data > 0
      multa = divida * (cobranca.multa/100) if data > cobranca.vencimento
    end

    divida_cobranca = divida + juros + multa - valor if divida

    pagamentoMaior = 0
    if divida_cobranca < 0
      pagamentoMaior = divida_cobranca
      divida_cobranca = 0
    end

    render json: {
      juros: juros.round(2),
      multa: multa.round(2),
      divida_cobranca: divida_cobranca.round(2),
      pagamentoMaior: pagamentoMaior.round(2)
    }
  end

  protected

  def recebimento_param
    if params[:recebimento].present?
      params.require(:recebimento).permit(:valor, :juros, :multa, :data, :cobranca_id)
    else
      {}
    end
  end

end
