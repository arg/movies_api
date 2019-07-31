class V1::UsersController < ApplicationController
  include GetCurrentUser

  def show
    @user = current_user
  end
end
