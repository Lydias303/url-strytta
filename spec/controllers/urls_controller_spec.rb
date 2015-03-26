require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "WELCOME #INDEX" do

    it "has a input field to shorten a long url" do
      get :index

      expect(page).to have_content(Stytta)
    end
  end
end
