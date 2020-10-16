class AlbumPolicy < ApplicationPolicy
  attr_reader :user, :post

  def destroy?
    user.admin?
  end
end