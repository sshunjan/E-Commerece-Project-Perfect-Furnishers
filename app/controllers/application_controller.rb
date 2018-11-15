class ApplicationController < ActionController::Base
  before_action :fetch_categories
  before_action :fetch_status_types

  private
  def fetch_categories
    @categories = Category.all()
  end

  def fetch_status_types
    @status_types = StatusType.all()
  end
end
