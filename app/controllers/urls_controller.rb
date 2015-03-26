class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:notice] = "Your shortened url has been created!"
      redirect_to root_path
    else
      flash[:error] = "Unable to shorten this url"
      render :new
    end
  end

private

  def url_params
    params.require(:url).permit(:title, :original_url, :shortened_url)
  end
end
