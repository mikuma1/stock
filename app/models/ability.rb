class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, %i[user organization order consumption login session registration]

    user ||= User.new
    can :manage, :all if user.admin?
  end
end
