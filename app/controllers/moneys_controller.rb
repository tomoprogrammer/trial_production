class MoneysController < ApplicationController

  def new
    @money = Money.new
  end

  def create
    @money = Money.new(money_params)
    @money.user_id = current_user.id
    redirect_to moneys_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def money_params
    params.require(:money).permit(:payment, :memo)
  end

end
