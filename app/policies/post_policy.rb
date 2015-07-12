 class PostPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    def initialize(user,scope)
      @user = user
      @scope = scope
    end
    def index?
      true
    end
    def resolve
      if user.admin?
        scope.all
      elsif user.member?
        user.show?
      else
        false
      end
    end
  end
 end