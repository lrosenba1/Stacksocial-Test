class TwitterResultsController < ApplicationController
  before_filter :authorize
  def index
     @searchString = params[:search]
     logger.debug @searchString.inspect
  end
end
