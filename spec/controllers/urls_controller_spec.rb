require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "URL #INDEX" do

    it "displays all urls" do

     get :index

     expect(response.status).to eq(200)
    end
  end
end
