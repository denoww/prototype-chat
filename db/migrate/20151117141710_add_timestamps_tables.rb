class AddTimestampsTables < ActiveRecord::Migration
  def change
    add_column :cobrancas, :created_at, :datetime
    add_column :cobrancas, :updated_at, :datetime

    add_column :recebimentos, :created_at, :datetime 
    add_column :recebimentos, :updated_at, :datetime
    
    add_column :composicao_cobrancas, :created_at, :datetime 
    add_column :composicao_cobrancas, :updated_at, :datetime 
  end
end
