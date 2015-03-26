require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "WELCOME #INDEX" do

    xit "has a input field to shorten a long url" do
      get :index

      expect().to have_content(Stytta)
    end
  end
end
