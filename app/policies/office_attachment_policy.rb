class OfficeAttachmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def create?
    record.user == user
  end

  def udpate?
    true
  end

  def destroy?
    true
  end
end
