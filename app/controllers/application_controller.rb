class ApplicationController < ActionController::Base
  before_action :fetch_categories
  before_action :fetch_status_types

  add_breadcrumb "Home", :root_path, :title => "Back to the Index"


  private
  def fetch_categories
    @categories = Category.all()
  end

  def fetch_status_types
    @status_types = StatusType.all()
  end
end
