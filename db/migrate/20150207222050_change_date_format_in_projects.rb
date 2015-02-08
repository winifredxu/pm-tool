class ChangeDateFormatInProjects < ActiveRecord::Migration
  def change
    change_column :projects, :due_date, :date
    change_column :tasks, :due_date, :date
    change_column :discussions, :due_date, :date
  end
end
