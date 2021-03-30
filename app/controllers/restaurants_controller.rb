class RestaurantsController < ApplicationController
  def index
  end

  def new
  end

  def list
    # 寫入表單
    # redirect 轉址 -> ex.回列表頁
    redirect_to '/restaurants'
  end

  def origin
  end
end