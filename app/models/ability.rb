class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :login
    can :manage, :session

    user ||= User.new 
      if user.admin?
         can :manage, :all
       else
         can :manage, :user
         can :read, :item
         can :manage, :order
         can :manage, :consumption
       end
  end
end
