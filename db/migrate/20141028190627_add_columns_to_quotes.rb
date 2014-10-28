class AddColumnsToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :ihq_id,  :string
    add_column :quotes, :source,  :string
  end
end
