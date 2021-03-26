class IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :income_id, only: [:show, :edit, :update, :destroy]
  before_action :income_user, only: [:index, :search]
  before_action :spending_user, only: [:index,:search, :show]
  before_action :move_to_index, only: [:show, :edit, :destroy, :update, :create]
  require "time"
  
  def index
    @spendings_time = Spending.where(date: Time.now.beginning_of_month..Time.now.end_of_month).includes(:user).order(date: "ASC")
    @incomes_time = Income.where(date: Time.now.beginning_of_month..Time.now.end_of_month).includes(:user).order(date: "ASC")
    @spending_sum = @spendings_time.sum(:price)
    @income_sum = @incomes_time.sum(:price)
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
  end

  def edit
  end

  def update
    if @income.update(income_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to root_path
  end

  def search
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
  def income_id
    @income = Income.find(params[:id])
  end
  def income_user
    @incomes = Income.includes(:user).order(date: "ASC")
  end
  def spending_user
    @spendings = Spending.includes(:user).order(date: "ASC")
  end
  def move_to_index
    if current_user.id != @income.user.id
      redirect_to root_path
    end
  end
end
