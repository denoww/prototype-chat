class CreateCobrancas < ActiveRecord::Migration
  def change
    create_table :cobrancas do |t|
      t.float :valor
      t.float :juros
      t.float :multa
      t.float :atualizado
      t.string :referencia
      t.string :nome
      t.string :pagador
      t.datetime :vencimento
      t.string :destinatario
      t.string :confCobranca
    end
  end
end
