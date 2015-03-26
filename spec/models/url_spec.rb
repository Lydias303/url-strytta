require 'rails_helper'

RSpec.describe Url, type: :model do

  it "is valid" do
    url = create(:url)

    expect(url).to be_valid
  end

  context "it is not valid" do
    it "without an original url" do
      url = create(:url)
      url.original_url = ""
      expect(url).to_not be_valid
    end

    it "creates unique shortened urls" do
      url = create(:url)
      url2 = create(:url)
      expect(url2.shortened_url).to_not eq(url.shortened_url)
    end
  end

  it "creates a six charactor shortened url on create" do
    url = create(:url)
    expect(url.shortened_url.length).to eq(6)
  end
end
