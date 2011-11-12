class RobotstxtsController < ApplicationController
  def show
    @profile = Profile.find(params[:profile_id])
    @robotstxt = @profile.robotstxt

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sitemap }
    end
  end
end