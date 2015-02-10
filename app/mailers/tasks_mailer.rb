class TasksMailer < ApplicationMailer

  def notify_task_owner(task)
     @user = @task.user
     mail to: @user.email, subject: "Ahoy hoy!"
  end
end

