class TweetsController < ApplicationController
  before_filter :authorize 
  #respond_to :html

  def index
    @tweets = Tweet.all
  end

end

