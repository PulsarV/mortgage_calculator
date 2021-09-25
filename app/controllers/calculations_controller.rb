# frozen_string_literal: true

class CalculationsController < ApplicationController
  before_action :get_bank
  before_action :set_calculation, only: [:show]

  def index
    breadcrumbs.add "Calculations History"
    @calculations = @bank.calculations.page(params[:page])
  end

  def show
    breadcrumbs.add "Your Calculation"
    @calculations = [@calculation]
  end

  def new
    breadcrumbs.add "New Calculation"
    @calculation = @bank.calculations.build
  end

  def create
    @calculation = @bank.calculations.build(calculation_params)

    if @calculation.save
      redirect_to bank_calculation_path(@bank, @calculation), notice: "Calculation was successfully created"
    else
      render :new, alert: "Calculation cannot be created"
    end
  end

  private
    def get_bank
      @bank = Bank.find(params[:bank_id])
    end

    def set_calculation
      @calculation = @bank.calculations.find(params[:id])
    end

    def calculation_params
      params.require(:calculation).permit(:bank_id, :interest_rate, :initial_loan, :down_payment, :loan_term)
    end
end
