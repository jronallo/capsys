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
    @sitemap.edits = [Edit.new(:profile => @profile, :user => current_user, :achievement_id => @sitemap.id,
      :action => 'create', :achievement_type => @sitemap.class.to_s)]
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

  def update
    @profile = Profile.find(params[:profile_id])
    @sitemap = @profile.sitemap
    @sitemap.attributes = params[:sitemap]
    if @sitemap.changed? and !params[:sitemap][:url].blank?
      @sitemap.edits << Edit.new(:profile => @profile, :user => current_user, 
        :achievement_id => @sitemap.id, :action => 'update', :achievement_type => @sitemap.class.to_s)
    
      respond_to do |format|
        if @sitemap.save
          format.html { redirect_to @profile, notice: 'Sitemap was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @sitemap.errors, status: :unprocesable_entity }
        end
      end
    elsif params[:sitemap][:url].blank?
      @sitemap.edits << Edit.new(:profile => @profile, :user => current_user, 
        :achievement_id => @sitemap.id, :action => 'destroy', :achievement_type => @sitemap.class.to_s)
      # if the url is empty then this achievement is no longer completed and ought to be removed
      @sitemap.destroy
      respond_to do |format|
        format.html { redirect_to profile_path(@profile), notice: 'Sitemap Achievement was destroyed.' }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to @profile, notice: 'Sitemap had no changes so was not updated.' }
        format.json { head :ok }
      end
    end
  end

  # def destroy
  #   @profile = Profile.find(params[:profile_id])
  #   @sitemap = Sitemap.find(params[:id])
  #   @sitemap.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to profile_path(@profile) }
  #     format.json { head :ok }
  #   end
  # end
end
