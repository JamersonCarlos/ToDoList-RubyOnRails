class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :string
      t.string :completed
      t.string :boolean, default: false

      t.timestamps
    end
  end
end
