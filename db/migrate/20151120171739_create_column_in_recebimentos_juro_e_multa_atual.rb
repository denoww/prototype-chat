class CreateColumnInRecebimentosJuroEMultaAtual < ActiveRecord::Migration
  def change
    add_column :recebimentos, :juros_atual, :decimal, precision: 14, scale: 2
    add_column :recebimentos, :multa_atual, :decimal, precision: 14, scale: 2
    add_column :recebimentos, :valor_base, :decimal, precision: 14, scale: 2
  end
end
