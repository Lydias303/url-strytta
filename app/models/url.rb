class Url < ActiveRecord::Base
  before_create :generate_shortened_url
  validates :original_url, presence: true
  validates :shortened_url, uniqueness: true

  def generate_shortened_url
    self.shortened_url = rand(36**6).to_s(36)
  end

  def display_shortened_url
    ENV['BASE_URL'] + self.shortened_url
  end

  def count_clicks
    
    clicks += 1
  end
end
