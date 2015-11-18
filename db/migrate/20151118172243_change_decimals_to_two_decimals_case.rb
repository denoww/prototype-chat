class ChangeDecimalsToTwoDecimalsCase < ActiveRecord::Migration
  def up
    change_column :cobrancas, :valor, :decimal, precision: 14, scale: 2
    change_column :composicao_cobrancas, :valor, :decimal, precision: 14, scale: 2
    change_column :recebimentos, :valor, :decimal, precision: 14, scale: 2
    change_column :recebimentos, :juros, :decimal, precision: 14, scale: 2
    change_column :recebimentos, :multa, :decimal, precision: 14, scale: 2
  end

  def down
    
  end
end
