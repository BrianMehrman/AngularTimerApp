class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to landing_path
    end
  end
  def page
    render :template => 'home/' + params[:path], :layout => nil
  end
end
