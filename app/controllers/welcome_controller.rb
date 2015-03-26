class WelcomeController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end
end
