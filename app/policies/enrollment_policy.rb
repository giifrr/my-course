class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.has_role?(:admin)
  end

  def edit?
    @user.enrollments.where(user_id: @user.id, id: @record.id).any?
  end

  def update?
    @user.enrollments.where(user_id: @user.id, id: @record.id).any?
  end

  def destroy?
    @user.has_role?(:admin) || @user.enrollments.where(user_id: @user.id, id: @record.id).any?
  end
end
