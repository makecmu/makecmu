class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :create, Membership
    cannot :index, Membership
    can :new, Project
    if user
			can :index, Membership
      can :create, Project
      can :manage, Project, :user_id => user.id
    end 
  end
end
