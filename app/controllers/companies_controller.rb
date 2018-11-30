class CompaniesController < ApplicationController
  before_action :require_company_logged_in, only: [:index, :show]
  before_action :correct_company, only: [:show, :edit, :update, :destroy]
  
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
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = '会社情報を変更しました'
      redirect_to @company
    else
      flash.now[:danger] = '会社情報の変更に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to root_url
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_company
    @company = Company.find(params[:id])
    redirect_to(root_url) unless @company == current_company
  end
  
end
