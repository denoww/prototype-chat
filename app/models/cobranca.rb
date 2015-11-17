# encoding: UTF-8
class Cobranca < ActiveRecord::Base
  has_many :recebimentos
  has_many :composicao_cobrancas

  def to_frontEnd_obj
    totais = {
      composicao: composicao_cobrancas.sum(:valor),
      recebimentos: recebimentos.sum(:valor)
    }
    return {
      id: id,
      valor: valor,
      juros: juros,
      multa: multa,
      divida_cobranca: divida,
      vencimento: vencimento,
      totais: totais,
      recebimentos: recebimentos.map(&:to_frontEnd_obj),
      composicaoCobranca: composicao_cobrancas.ordem_de_criacao.map(&:to_frontEnd_obj)
    }
  end

  def divida
    receb = recebimentos.sum(:valor)
    comp = composicao_cobrancas.sum(:valor)
    if receb == comp || receb == 0
      return 0
    else
      return comp - receb
    end
  end

end
