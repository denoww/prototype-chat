class CreateComposicaoCobrancas < ActiveRecord::Migration
  def change
    create_table :composicao_cobrancas do |t|
      t.belongs_to :cobrancas, index: true
      
      t.float :valor
      t.string :titulo
    end
  end
end