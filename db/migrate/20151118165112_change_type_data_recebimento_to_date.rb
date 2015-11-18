class ChangeTypeDataRecebimentoToDate < ActiveRecord::Migration
  def up
    change_column :recebimentos, :data, :date
  end

  def down
    change_column :recebimentos, :data, :datetime
  end

end
