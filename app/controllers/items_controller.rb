class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.all
  end

  def create
  end
end
