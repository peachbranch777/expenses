class IncomesController < ApplicationController
  before_action :authenticate_user!
  require "time"
  
  def index
    @income = Income.includes(:user).order(date: "ASC")
    @spending = Spending.includes(:user).order(date: "ASC")
    @spendings = Spending.where(date: Time.now.beginning_of_month..Time.now.end_of_month).includes(:user).order(date: "ASC")
    @incomes = Income.where(date: Time.now.beginning_of_month..Time.now.end_of_month).includes(:user).order(date: "ASC")
    @spending_sum = @spendings.sum(:price)
    @income_sum = @incomes.sum(:price)
    @expense_sum = @income_sum - @spending_sum
    @spending_data = Spending.all.where(date: Time.now.beginning_of_month..Time.now.end_of_month)
    @this_month = Time.new.month
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

  def search
    @income = Income.includes(:user).order(date: "ASC")
    @spending = Spending.includes(:user).order(date: "ASC")
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
end
