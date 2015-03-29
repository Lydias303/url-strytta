class WelcomeController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.sort_by_most_recent
  end
end
