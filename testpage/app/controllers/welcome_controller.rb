class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "user", password: "secret"
  def index
  end
end
