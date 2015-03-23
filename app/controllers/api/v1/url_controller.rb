class Api::V1::UrlController < ApplicationController
  respond_to :html, :json

  def show
    @url = Url.find(params[:id].to_i)

    respond_with @url
  end

  def index
    @urls = Url.all

    respond_with @urls
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      respond_to do |format|
        format.html { redirect_to urls_path, notice: "Url Created!"}
        format.json {render json: {mesage: "Url Created!", url: @url}}
      end
    else
      respond_to do |format|
        format.html { render :new}
        format.json { render json: {message: "Item not created", errors: @item.errors }}
      end
    end
  end

  def destroy

  end

  def update
    @url = Url.find(params[:id])

    if @url.update(url_params)
      respond_to do |format|
        format.html { redirect_to urls_path, notice: "Updated!"}
        format.json { render json: {message: "Updated", url: @url}}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json { render json: { message: "Not able to update this url!"}}
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :shortened_url, :title)
  end
end
