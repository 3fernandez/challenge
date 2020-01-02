require 'nokogiri'

class Parser
  def self.parse_html(html)
    parsed_html = Nokogiri::HTML(html)
    parsed_html.search('div.review-entry')
  end
end
