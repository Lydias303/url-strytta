class Url < ActiveRecord::Base
  before_create :generate_shortened_url

  def generate_shortened_url
    self.shortened_url = self.id.to_s(36)
    self.save
  end

  def display_shortened_url
    ENV['BASE_URL'] + self.shortened_url
  end
end
