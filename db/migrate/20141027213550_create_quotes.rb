class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :tss_id
      t.text :content
      t.string :author
      t.string :category

      t.timestamps
    end
  end
end
