class RecruitsController < ApplicationController
  before_action :require_company_logged_in
  before_action :correct_company, only: [:show, :edit, :destroy]

  def new
    if current_company.stores.empty?
      redirect_to new_store_path
    else
      @recruit = Recruit.new
      #@store_recruit = StoreRecruit.new
    end
  end
  
  def create
    @recruit = current_company.recruits.build(recruit_params) 

    if @recruit.save
      flash[:success] = '求人情報を登録しました'
      @store_recruit = @recruit.store_recruits.create(store_id: params[:recruit][:store_ids], recruit_id: @recruit.id)
      redirect_to root_url
    else
      flash.now[:danger] = '求人情報の登録に失敗しました'
      render :new
    end
  end
  
  def show
    @recruit = Recruit.find(params[:id])
    @store_recruit = StoreRecruit.find_by(recruit_id: @recruit.id)
  end
  
  def edit
    @recruit = Recruit.find(params[:id])
    @store_recruit = StoreRecruit.find_by(recruit_id: @recruit.id)
  end
  
  def update
    @recruit = current_company.recruits.find(params[:id])
    @store_recruit = StoreRecruit.find_by(recruit_id: @recruit.id)
    
    if @recruit.update(recruit_params)
      flash[:success] = '求人情報を変更しました'
      @store_recruit = @recruit.store_recruits.update(store_id: params[:recruit][:store_ids], recruit_id: @recruit.id)
      redirect_to root_url
    else
      flash.now[:danger] = '求人情報の変更に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @recruit = Recruit.find(params[:id])
    @recruit.destroy

    redirect_to root_url
  end
  
  private
  
  def recruit_params
    params.require(:recruit).permit(:startdate, :enddate, :agent, :cost, :area, :application_num, :interview_num, :employ_num, :memo)
  end
  
  def correct_company
    @recruit = current_company.recruits.find_by(id: params[:id])
    unless @recruit
      redirect_to root_url
    end
  end
  
end
