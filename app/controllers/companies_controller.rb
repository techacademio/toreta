class CompaniesController < ApplicationController
  before_action :require_company_logged_in, only: [:show]
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    
    if @company.save
      flash[:success] = '会員登録しました'
      redirect_to @company
    else
      flash.now[:danger] = '会員登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
end
