class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_record_form = ::PurchaseRecordForm.new
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?

    redirect_to root_path
  end

  def create
    @purchase_record_form = ::PurchaseRecordForm.new(purchase_params)

    if @purchase_record_form.valid?
      pay_item
      @purchase_record_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
