class AddDueDateToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :due_date, :datetime
  end
end
