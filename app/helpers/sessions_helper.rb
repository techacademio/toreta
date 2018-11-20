module SessionsHelper
  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end
  
  def logged_in?
    !!current_company
  end
end
