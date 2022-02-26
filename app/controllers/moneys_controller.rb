class MoneysController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    @money = Money.new
  end

  def create
    @money = Money.new(money_params)
    @money.user_id = current_user.id
    @money.save
    redirect_to moneys_path
  end
  
  def index
    @money = Money.new
    @moneys = Money.all
    @user = current_user
  end

  def show
    @book = Money.find(params[:id])
    @user = @money.user
    @money_new = Money.new
  end

  def edit
    @money = Money.find(params[:id])
    redirect_to moneys_path
  end

  def update
    @money = Money.find(params[:id])
    redirect_to money_path(@money.id)
  end

  def destroy
    @money = Money.find(params[:id])
    @money.destroy
    redirect_to moneys_path
  end

  private

  def money_params
    params.require(:money).permit(:payment, :memo)
  end
  
  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Money.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

end
