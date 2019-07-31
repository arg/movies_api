module GetCurrentUser
  extend ActiveSupport::Concern

  private

  def current_user
    @_current_user ||= User.find(params[:user_id])
  end
end
