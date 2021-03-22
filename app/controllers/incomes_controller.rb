class IncomesController < ApplicationController
  def index
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
end
