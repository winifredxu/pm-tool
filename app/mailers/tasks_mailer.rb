class TasksMailer < ApplicationMailer

  def notify_project_members(task)
     @task = @task
     @project = @task.project
     @user = @project.user
     mail to: @user.email, subject: "Ahoy hoy!"
  end
end
