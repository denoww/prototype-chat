# encoding: UTF-8
class Cobranca < ActiveRecord::Base
  has_many :recebimentos
  has_many :composicao_cobrancas

  def to_frontEnd_obj
    return {
      id: id,
      valor: valor,
      juros: juros,
      multa: multa,
      divida_cobranca: divida,
      vencimento: vencimento,
      totais: getTotais,
      recebimentos: recebimentos.map(&:to_frontEnd_obj),
      composicaoCobranca: composicao_cobrancas.ordem_de_criacao.map(&:to_frontEnd_obj)
    }
  end

  def getTotais
    return {
      composicao: composicao_cobrancas.sum(:valor),
      recebimentos: recebimentos.sum(:valor)
    }
  end

  def divida
    receb = recebimentos.sum(:valor)
    comp = composicao_cobrancas.sum(:valor)
    return 0 if receb == comp || receb == 0
    return comp - receb
  end

end
