class OfficeAttachmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def udpate?
    record.user == user
  end
end
