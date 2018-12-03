class ApplicationController < ActionController::Base
  before_action :fetch_categories
  before_action :fetch_status_types
  before_action :fetch_provinces
  before_action :fetch_profile

  add_breadcrumb "Home", :root_path, :title => "Back to the Index"


  private
  def fetch_categories
    @categories = Category.all()
  end

  def fetch_status_types
    @status_types = StatusType.all()
  end

  def fetch_provinces
    @provinces = Tax.all()
  end

  def fetch_profile
    if user_signed_in?
      @profile = current_user.profile
    end
  end
end
