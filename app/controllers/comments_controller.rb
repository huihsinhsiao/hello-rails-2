class CommentsController < ApplicationController
  before_action :check_user!

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.new(comment_params)
    # @comment.user = current_user

    if @comment.save
      # 執行 create.js.erb
      # redirect_to restaurant_path(@restaurant)  # 餐廳的 show
      #沒設定存檔後去哪，會自動找同名的view，也就是comments裡面的create.js.erb
    else
      render 'restaurants/show'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
                            .merge({user: current_user})
  end

end
