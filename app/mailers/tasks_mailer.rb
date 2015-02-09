class TasksMailer < ApplicationMailer

  def notify_project_members(task)
     @project = task.project_id
     @user = @project.user_id
     mail to: @user.email, subject: "Ahoy hoy!"
  end
end

class AnswersMailer < ApplicationMailer

  def notify_question_owner(answer)
    @answer   = answer
    @question = @answer.question
    @user     = @question.user
    mail to: @user.email, subject: "You've got an answer!"
  end

end