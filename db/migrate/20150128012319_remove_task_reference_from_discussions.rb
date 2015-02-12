class RemoveTaskReferenceFromDiscussions < ActiveRecord::Migration
  def change
  	remove_foreign_key :discussions, :task
  	remove_column :discussions, :task_id
  end
end
