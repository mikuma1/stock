class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, [:user, :order, :consumption, :organization, :login, :session, :registration]

    user ||= User.new 
      if user.admin?
         can :manage, :all
      end
  end
end
