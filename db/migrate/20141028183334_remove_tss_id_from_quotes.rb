class RemoveTssIdFromQuotes < ActiveRecord::Migration
  def change
    remove_column :quotes, :tss_id
  end
end
