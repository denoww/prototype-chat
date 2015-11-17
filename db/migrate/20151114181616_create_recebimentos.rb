class CreateRecebimentos < ActiveRecord::Migration
  def change
    create_table :recebimentos do |t|
      t.belongs_to :cobrancas, index: true

      t.datetime :data
      t.float :valor
      t.float :juros
      t.float :multa
    end
  end
end
