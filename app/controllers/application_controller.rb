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

  private
  def fetch_profile
    if user_signed_in?
      @profile_id = current_user.profile_id

      if @profile_id
        @profile = Profile.find(@profile_id)
      end
    end
  end
end
