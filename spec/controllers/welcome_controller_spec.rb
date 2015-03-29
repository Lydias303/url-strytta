require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "WELCOME #INDEX" do

    it "displays all urls" do

     get :index

     expect(response.status).to eq(200)
    end
  end
end
