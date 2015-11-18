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
    composicao = composicao_cobrancas.sum(:valor)
    juros = recebimentos.sum(:juros)
    multa = recebimentos.sum(:multa)
    return {
      composicao: composicao + juros + multa,
      recebimentos: recebimentos.sum(:valor),
      juros: juros,
      multa: multa
    }
  end

  def divida
    totais = getTotais
    return valor if recebimentos.empty?
    return totais[:composicao] - totais[:recebimentos]
  end

end
