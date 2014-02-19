class TemplatesController < ApplicationController
  # before_filter :authenticate_user! , except: :index

  def index
    # binding.pry
    current_or_guest_user
  end

  def template
    render :template => 'templates/' + params[:path], :layout => nil
  end
end
