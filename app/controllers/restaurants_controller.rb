class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:edit, :update, :destroy]
  before_action :check_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.available
    # @restaurants = Restaurant.available.abc.def #scope方法可以連發
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.order(id: :desc) #餐廳的留言且排序倒序
  end

  def pocket_list
    @restaurant = Restaurant.find(params[:id])
    
    if current_user.like?(@restaurant)
      # 移除名單
      current_user.pocket_list.destroy(@restaurant)
      render json: { id: @restaurant.id, status: 'removed' } #這裡可以前後端協調要回傳什麼
    else
      # 加名單
      current_user.pocket_list << @restaurant
      render json: { id: @restaurant.id, status: 'added' } #方便前端知道收到什麼結果要演什麼戲
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # 寫入資料庫
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
    @restaurant = current_user.restaurants.new(restaurant_params)
    
    if @restaurant.save
      # redirect 轉址 -> 回列表頁
      redirect_to restaurants_path, notice: "新增餐廳成功！"
    else
      render :new #render ->借new.html.erb
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: "編輯餐廳成功！"
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: "刪除餐廳成功！"
  end

  private
    def find_restaurant
      # 1
      # @restaurant = Restaurant.find(params[:id])
      # @restaurant = Restaurant.find_by!(
      #   id: params[:id],
      #   user_id: current_user.id
      # )

      # 2
      @restaurant = current_user.restaurants.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :email, :address, :description)
    end
end