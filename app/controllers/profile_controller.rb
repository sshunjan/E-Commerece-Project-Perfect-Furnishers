class ProfileController < ApplicationController



  def index
    add_breadcrumb "Profile", :profile_index_path
  end

  def create
    add_breadcrumb "Profile", :profile_create_path

    if(params[:firstName])
      profile = Profile.new()
      profile.user = current_user
      profile.name = "#{params[:firstName]}  #{params[:lastName]}"
      profile.address = params[:address]
      profile.city = params[:city]
      profile.state = params[:province]
      profile.zip = params[:zip].to_i
      profile.phone = params[:zip].to_i
      profile.save()

      redirect_to profile_index_path
    end
  end

  def update
    add_breadcrumb "Profile", :profile_update_path
  end
end
