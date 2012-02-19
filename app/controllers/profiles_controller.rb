class ProfilesController < ApplicationController
    
  before_filter :logged_in?, :except => [:index, :show]
  before_filter :clean_categories, :only => [:create, :update]
  
  # GET /profiles
  # GET /profiles.json
  def index
    if params[:category]
      @profiles = Profile.find_all_by_categories(params[:category], :order => :name)
    else
      category_list
      @profiles = Profile.all(:order => :name)
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new
    category_list
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    category_list
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        category_list
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy     
    @profile = Profile.find(params[:id])
    # do not allow profiles to be destroyed right now
    redirect_to @profile    
    
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end
  
  private
    
  def clean_categories
    if params[:profile][:categories] 
      categories = params[:profile][:categories].split(',')
      uniq_categories = categories.map do |category|
        category.strip!
        category unless category.blank?
      end.compact.uniq.sort      
      if uniq_categories.length > 1 and uniq_categories.include?("Unknown")
        uniq_categories = uniq_categories - ["Unknown"]
      end
      uniq_categories = ["Unknown"] if uniq_categories.blank?
      params[:profile][:categories] = uniq_categories      
    end    
  end
  
end
