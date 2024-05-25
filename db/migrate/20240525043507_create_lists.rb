class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
