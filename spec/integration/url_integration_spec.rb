require "rails_helper"

describe "url"  do
  include Capybara::DSL
  before(:each) do
    visit root_path
  end

  it "can create a new url" do
    fill_in "url[original_url]", with: "https://google.com/capybara/rspec"
    click_link_or_button("Create Url")
    expect(page).to have_content("Your shortened url has been created!")
  end

  it "cannot create a new url without an original long url" do
    fill_in "url[original_url]", with: ""
    click_link_or_button("Create Url")
    expect(page).to have_content("Please fill out this field.")
  end

  it "can see the new url's title and shortened url" do
    new_url = create(:url)

    visit root_path
    expect(page).to have_content(new_url.title)
    expect(page).to have_content(new_url.shortened_url)
  end

  it "can view the index by popularity" do
    new_url = create(:url, clicks: 3)
    fresh_url = create(:url, clicks: 1)

    visit root_path
    within(page.first(:css, 'li')) do
      expect(page).to have_content(new_url.title)
      expect(page).to have_content(new_url.shortened_url)
      expect(page).to_not have_content(fresh_url.shortened_url)
    end
  end

  it "can view the index by most recent" do
    new_url = create(:url)
    fresh_url = create(:url)

    visit root_path

    click_link_or_button("Sort By Most Recent")

    expect(current_path).to eq(urls_path)

    expect(find(:css, 'li', match: :first).text).to include(new_url.title)
    expect(find(:css, 'li', match: :first).text).to include(new_url.shortened_url)
    expect(find(:css, 'li', match: :first).text).to_not include(fresh_url.shortened_url)
  end
end
