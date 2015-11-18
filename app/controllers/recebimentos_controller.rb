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

  def jurosMulta
    cobranca = Cobranca.where(id: params[:cobranca_id]).first
    if params[:data].present?
      if cobranca.recebimentos.count == 0
        diferenca_data = (params[:data].to_date  - cobranca.vencimento.to_date)
        multa = diferenca_data != 0 ? (cobranca.valor * (cobranca.multa/100)) : 0
      else
        diferenca_data = (params[:data].to_date - cobranca.recebimentos.last.data.to_date)
        multa = 0
      end
      divida = cobranca.divida
      if divida != 0
        juros = divida * (cobranca.juros/100) * diferenca_data
        valor = divida
      else
        juros = cobranca.valor * (cobranca.juros/100) * diferenca_data
        valor = cobranca.valor
      end
    else
      juros = multa = 0
      valor = params[:valor]
    end
    juros = 0 if juros < 0
    multa = 0 if multa < 0
    divida_cobranca = valor + juros + multa - params[:valor]
    render json: {
      juros: juros.round(2),
      multa: multa.round(2),
      divida_cobranca: divida_cobranca.round(2)
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
