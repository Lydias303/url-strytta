FactoryGirl.define do
  factory :url do
    original_url "http://www.google.com"
    title "My Url"
    created_at Time.now
    clicks 0
  end
end
