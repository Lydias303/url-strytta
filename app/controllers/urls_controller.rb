class UrlsController < ApplicationController

  def index
    if params[:sort] == "popularity"
      @urls = Url.sort_by_popularity
    elsif params[:sort] == "most-recent"
      @urls = Url.sort_by_most_recent
    else
    @urls = Url.all
    end
  end

  def show
    @url = Url.find(params[:id])
    @url.clicks += 1
    @url.save
    redirect_to @url.original_url
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      FindTitleWorker.perform_async(@url.id)
      redirect_to root_path, notice: "Your shortened url has been created!"
    else
      flash[:error] = "Unable to shorten this url"
    end
  end

private

  def url_params
    params.require(:url).permit(:title, :original_url, :shortened_url, :clicks)
  end
end
