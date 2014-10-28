class RemoveAuthor < ActiveRecord::Migration
  def change
    remove_column :quotes, :author
    remove_column :quotes, :category
  end
end
