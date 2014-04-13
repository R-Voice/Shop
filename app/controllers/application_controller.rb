class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authorize
  protect_from_forgery with: :exception
  before_action  :current_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def current_cart
  	@cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	@cart = Cart.create
  	session[:cart_id] = @cart.id
  	@cart
  end
end
