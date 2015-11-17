class ChangeTypeVencimentoFromCobranca < ActiveRecord::Migration
  def up
    change_column :cobrancas, :vencimento, :date
  end

  def down
    change_column :cobrancas, :vencimento, :datetime
  end
end
