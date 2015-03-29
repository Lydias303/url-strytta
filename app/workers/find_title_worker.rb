class FindTitleWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 3

  def perform(url_id)
    @url = Url.find(url_id)
    doc = Nokogiri::HTML(HTTParty.get(@url.original_url))
    page_title = doc.css("title").first.child.text
    @url.title = page_title
    @url.save
  end
end
