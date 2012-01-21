class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :new, Project
    if user
      can :create, Project
      can :manage, Project, :user_id => user.id
    end 
  end
end
