class PagesController < ApplicationController

  def permalink
    @page = Page.find_by(permalink: params[:permalink])

    add_breadcrumb "#{@page.title}"

    if @page.nil?
      redirect_to root_url
    else
      render :show
    end

  end

end
