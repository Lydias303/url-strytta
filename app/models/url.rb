class Url < ActiveRecord::Base
  before_create :fetch_title

  require 'securerandom'

  before_create :generate_shortened_url
  validates :original_url, presence: true

  def generate_shortened_url
    self.shortened_url = SecureRandom.urlsafe_base64(4)
    # self.shortened_url = rand(36**6).to_s(36)
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

  def fetch_title
    doc = Nokogiri::HTML(HTTParty.get(original_url))
    page_title = doc.css("title").first.child.text
    self.title = page_title
  end
end
