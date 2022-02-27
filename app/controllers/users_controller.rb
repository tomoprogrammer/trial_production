class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction


  def index
    @money = Money.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @moneys = @user.moneys.page(params[:page]).per(10)
    @money = Money.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Money.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

end
