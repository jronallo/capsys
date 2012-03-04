class AchievementsController < ApplicationController
  
  def index
    Rails.application.eager_load! if Rails.env == 'development'
    @achievements = Achievement.subclasses
  end
  
end