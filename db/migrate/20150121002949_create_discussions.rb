class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :description
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :discussions, :tasks
  end
end
