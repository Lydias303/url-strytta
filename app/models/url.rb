class Url < ActiveRecord::Base
  before_create :generate_shortened_url
  before_create :get_title
  validates :original_url, presence: true

  def generate_shortened_url
    self.shortened_url = rand(36**6).to_s(36)
  end

  def display_shortened_url
    ENV['BASE_URL'] + "#{self.shortened_url}"
  end

  def self.sort_by_popularity
    all.order(clicks: :desc)
  end

  def self.sort_by_most_recent
    all.order(created_at: :desc)
  end

  def get_title

  end
end
