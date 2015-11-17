class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :cobrancas, :referencia
    remove_column :cobrancas, :nome
    remove_column :cobrancas, :pagador
    remove_column :cobrancas, :destinatario
    remove_column :cobrancas, :confCobranca
  end
end
