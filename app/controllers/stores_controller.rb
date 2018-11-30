class StoresController < ApplicationController
  before_action :require_company_logged_in, only: [:show]
  before_action :correct_company, only: [:destroy]
  
  def show
    @store = Store.find(params[:id])
  end
   
  def new
    @store = Store.new
  end

  def create
    @store = current_company.stores.build(store_params)
    
    if @store.save
      flash[:success] = '店舗情報を登録しました'
      redirect_to stores_path
    else
      flash.now[:danger] = '店舗情報の登録に失敗しました'
      render :new
    end
  end
  
  def index
    @stores = current_company.stores
  end
  
  def destroy
    @store.destroy
    redirect_to stores_path
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    @store = current_company.stores.find(params[:id])
    
    if @store.update(store_params)
      flash[:success] = '店舗情報を変更しました'
      redirect_to @store
    else
      flash.now[:danger] = '店舗情報の変更に失敗しました'
      render :edit
    end
  end
  
  private
  
  def store_params
    params.require(:store).permit(:store, :address, :tel_num)
  end
  
  def correct_company
    @store = current_company.stores.find_by(id: params[:id])
    unless @store
      redirect_to root_url
    end
  end
  
end
