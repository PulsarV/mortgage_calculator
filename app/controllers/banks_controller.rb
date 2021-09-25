# frozen_string_literal: true

class BanksController < ApplicationController
  before_action :set_bank, only: [:edit, :update, :destroy]

  def index
    @banks = Bank.all.page(params[:page])
  end

  def new
    breadcrumbs.add "New Bank"
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to banks_path, notice: "Bank was successfully created"
    else
      render :new, alert: "Bank cannot be created"
    end
  end

  def edit
    breadcrumbs.add "Edit Bank"
  end

  def update
    if @bank.update(bank_params)
      redirect_to banks_path, notice: "Bank was successfully updated"
    else
      render :edit, alert: "Bank cannot be updated"
    end
  end

  def destroy
    @bank.destroy

    redirect_to banks_path, notice: "Bank was successfully deleted"
  end

  private
    def bank_params
      params.require(:bank).permit(:name, :interest_rate, :max_loan, :min_down_payment, :loan_term)
    end

    def set_bank
      @bank = Bank.find(params[:id])
    end
end
