class IncomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @income = Income.includes(:user).order(date: "ASC")
    @spending = Spending.includes(:user).order(date: "ASC")
    @spendings = Spending.where(date: Time.now.beginning_of_month..Time.now.end_of_month)
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

  def show
    @income = Income.find(params[:id])
    @spending = Spending.includes(:user).order(date: "ASC")
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to root_path
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
end
