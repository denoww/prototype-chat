# encoding: UTF-8
class ComposicaoCobranca < ActiveRecord::Base
  validates :titulo, :cobranca_id, :valor, presence: {message: "Não pode ser vazio"} 
  
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
