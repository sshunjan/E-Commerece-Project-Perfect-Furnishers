class ProfileController < ApplicationController
  def index
    add_breadcrumb "Profile", :profile_index_path
  end

  def create
    add_breadcrumb "Profile", :profile_create_path

    if(params[:firstName])

      user = User.find(current_user.id)
      user.username = params[:firstName]
      user.save()

      @tax = Tax.find(params[:province])

      profile = Profile.new()
      profile.user = current_user
      profile.name = "#{params[:firstName]}  #{params[:lastName]}"
      profile.address = params[:address]
      profile.city = params[:city]
      profile.tax = @tax
      profile.zip = params[:zip]
      profile.phone = params[:phone].to_i
      profile.save()

      redirect_to profile_index_path
    end
  end

  def update
    add_breadcrumb "Profile", :profile_update_path
  end
end
