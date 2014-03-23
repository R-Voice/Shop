class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authorize
  protect_from_forgery with: :exception
  before_filter :current_cart

  protected

  def authorize
    if User.count.zero?
      redirect_to new_user_path, notice: "Please create the first user account" 
    else
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: 'Пожалуйста, пройдите авторизацию'
      end
    end
  end

  def current_cart
  	@cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	@cart = Cart.create
  	session[:cart_id] = @cart.id
  	@cart
  end
end
