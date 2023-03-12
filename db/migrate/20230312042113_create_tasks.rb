class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :uid, :null => false, :foreign_key => true
      t.string :title
      t.boolean :isDone, :default => false
      t.text :desc
      t.datetime :deadline
      t.timestamps
    end
  end
end
