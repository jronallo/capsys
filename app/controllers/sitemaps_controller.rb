class SitemapsController < ApplicationController
  
  before_filter :logged_in?, :except => [:show]
  
  # GET /sitemaps
  # GET /sitemaps.json
  def index
    @sitemaps = Sitemap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sitemaps }
    end
  end

  # GET /sitemaps/1
  # GET /sitemaps/1.json
  def show
    @profile = Profile.find(params[:profile_id])
    @sitemap = @profile.sitemap

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sitemap }
    end
  end

  # GET /sitemaps/new
  # GET /sitemaps/new.json
  def new
    @profile = Profile.find(params[:profile_id])
    @sitemap = Sitemap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sitemap }
    end
  end

  # GET /sitemaps/1/edit
  def edit
    @profile = Profile.find(params[:profile_id])
    @sitemap = @profile.sitemap
  end

  # POST /sitemaps
  # POST /sitemaps.json
  def create
    @profile = Profile.find(params[:profile_id])
    @sitemap = Sitemap.new(params[:sitemap])
    @sitemap.profile = @profile
    respond_to do |format|
      if @sitemap.save
        format.html { redirect_to @profile, notice: 'Sitemap was successfully created.' }
        format.json { render json: @profile, status: :created, location: @sitemap }
      else
        format.html { render action: "new" }
        format.json { render json: @sitemap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sitemaps/1
  # PUT /sitemaps/1.json
  def update
    @profile = Profile.find(params[:profile_id])
    @sitemap = @profile.sitemap

    respond_to do |format|
      if @sitemap.update_attributes(params[:sitemap])
        format.html { redirect_to @profile, notice: 'Sitemap was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sitemap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitemaps/1
  # DELETE /sitemaps/1.json
  def destroy
    @profile = Profile.find(params[:profile_id])
    @sitemap = Sitemap.find(params[:id])
    @sitemap.destroy

    respond_to do |format|
      format.html { redirect_to profile_path(@profile) }
      format.json { head :ok }
    end
  end
end
