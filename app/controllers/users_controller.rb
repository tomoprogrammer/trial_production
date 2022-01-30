class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction


  def index
    @money = Money.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @moneys = @user.moneys
    @money = Money.new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
