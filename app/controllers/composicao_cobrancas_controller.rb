# encoding: UTF-8
class ComposicaoCobrancasController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    composicao = ComposicaoCobranca.new(composicao_params)
    if composicao.save
      render json: composicao
    else
      render ::Response.object_erros(composicao)
    end
  end

  def destroy
    composicao = ComposicaoCobranca.where(id: params[:id]).first
    if composicao
      if composicao.destory
        render json: composicao
      else
        render ::Response.object_erros(composicao)
      end
    else
      render ::Response.not_found
    end
  end

  protected

  def composicao_params
    if params[:composicao].present?
      params.require(:composicao).permit(:valor, :cobranca_id, :titulo)
    else
      {}
    end
  end
end
