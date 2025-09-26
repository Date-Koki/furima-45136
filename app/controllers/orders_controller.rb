class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_record_form = ::PurchaseRecordForm.new
  end

  def create
    @purchase_record_form = ::PurchaseRecordForm.new(purchase_params)

    if @purchase_record_form.valid?
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_record_form).permit(:postcode, :prefecture_id, :municipality, :street_address, :building_name,
                                                 :telephone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
