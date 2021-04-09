class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.order(id: :desc) #all方法可省略
  end

  def show
    # begin 
    #   @restaurant = Restaurant.find(params[:id]) #因為這是激烈的
    # rescue 
    #   redirect_to restaurants_path #所以設定找不到就讓他轉回全部列表
    # end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # 寫入資料庫
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save
      # redirect 轉址 -> 回列表頁
      redirect_to restaurants_path
    else
      render :new #render ->借new.html.erb
    end
  end

  def edit
  end

  def update

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      reder :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurant_path
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :email, :address, :description)
    end

end