class ApplicationController < ActionController::API
  include ActionController::Caching # https://github.com/rails/jbuilder/issues/331

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404
    render json: { status: 'not found' }, status: :not_found
  end
end
