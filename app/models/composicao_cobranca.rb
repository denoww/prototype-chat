# encoding: UTF-8
class ComposicaoCobranca < ActiveRecord::Base
  belongs_to :cobranca

  scope :ordem_de_criacao, lambda { order("created_at asc") }

  def to_frontEnd_obj
    {
      valor: valor,
      titulo: titulo,
      created_at: created_at
    }
  end

end
