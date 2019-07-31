class V1::PurchasesController < ApplicationController
  include GetCurrentUser

  def index
    @purchases = current_user.purchases.order(expires_at: :asc)
  end

  def create
    item = Item.find(params[:item_id])
    purchase = current_user.purchases.new(item: item, option: params[:option])
    if purchase.save
      head :no_content
    else
      render json: purchase.errors, status: :unprocessable_entity
    end
  end
end
