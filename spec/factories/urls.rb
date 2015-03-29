FactoryGirl.define do
  factory :url do
    original_url "imalongurl"
    title "My Url"
    created_at Time.now
    clicks 0
  end
end
