class EditsController < ApplicationController
  
  def index
    @edits = Edit.limit(50).all
  end
end