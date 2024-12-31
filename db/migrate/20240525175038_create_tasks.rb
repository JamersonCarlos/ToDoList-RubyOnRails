class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :term 
      t.string :member, default: "Jamerson Carlos"
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
