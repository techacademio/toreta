class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:company_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @company = Company.find_by(email: email)
    if @company && @company.authenticate(password)
      session[:company_id] = @company.id
      return true
    else
      return false
    end
  end
end
