require 'rails_helper'

RSpec.describe Api::V1::UrlController, type: :controller do

  describe "GET #INDEX" do

    it "responds to json in the url index" do
      url = create(:url)

      get :index, format: :json

      urls = JSON.parse(response.body)

      first_url = urls.first

      expect(response.status).to eq(200)
      expect(first_url["original_url"]).to eq(url.original_url)
    end
  end

  describe "GET #SHOW" do

    it "can show a single url in the show" do
      url = create(:url)

      get :show, id: url.id,  format: :json

      show_url = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(show_url["original_url"]).to eq(url.original_url)
    end
  end

  describe "POST create" do

    it "can create a new url with json" do
      json = { :format => 'json', :url => {:title => "url", :original_url => "https://blah.com/2342134123ewas", :shorted_url => "http://localhost:3000/12"}}

      post :create, json

      expect(Url.count).to eq(1)
    end
  end

  describe "PUT UPDATE" do

    it "can upfate a url with json" do
      url = create(:url)

      updated_params = {:title => "Cloud", :original_url => "https://blah.com/2342134123ewas", :shorted_url => "http://localhost:3000/12"}

      put :update, id: url.id, url: updated_params, format: 'json'

      expect(Url.first.title).to eq("Cloud")
    end
  end
end
