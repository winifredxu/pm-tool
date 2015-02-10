class RemoveDueDateFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :due_date
end
end
