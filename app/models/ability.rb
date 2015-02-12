class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    #makes sure we don't get user = nil if they're not logged in

    can :manage, Project do |project|
      project.user == user
      #if the project user is logged in it can manage that project
    end

    can :edit, Project do |project|
        project.user == user #|| project.members.include?(user)
      end

    #only a project creator can now edit or a project member









    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
