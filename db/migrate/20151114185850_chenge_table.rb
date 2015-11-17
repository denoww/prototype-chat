class ChengeTable < ActiveRecord::Migration
  def change
    drop_table :recebimentos
    drop_table :composicao_cobrancas

    create_table :recebimentos do |t|
      t.belongs_to :cobranca, index: true

      t.datetime :data
      t.float :valor
      t.float :juros
      t.float :multa
    end

    create_table :composicao_cobrancas do |t|
      t.belongs_to :cobranca, index: true
      
      t.float :valor
      t.string :titulo
    end
  end
end
