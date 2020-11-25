class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, [:user, :organization, :order, :consumption, :login, :session, :registration]

    user ||= User.new 
      if user.admin?
         can :manage, :all
      end
  end
end
