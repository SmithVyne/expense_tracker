class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    date = Date.parse(params[:expense_date])
    @expenses = Expense.where(created_at: date.midnight..date.end_of_day).group_by{|c| c.category_id}

    render json: @expenses
  end

  # GET /expenses/1
  def show
    render json: @expensed
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      @expense.category.increment!(:total, @expense.amount)
      render json: @expense, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:title, :amount, :category_id)
    end
end
