module GetCurrentUser
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def current_user
    @_current_user ||= User.find(params[:user_id])
  end
end
