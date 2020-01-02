require_relative 'scraper'
require_relative 'parser'
require_relative 'review'
require_relative 'analyzer'
require_relative 'printer'

class Controller
  BASE_URL        = 'https://www.dealerrater.com'
  SEARCH_TERM     = 'McKaig Chevrolet Buick'
  PAGES_TO_SCRAPE = 5

  def self.show_overly_excited_reviews
    review_pages = Scraper.new(BASE_URL, SEARCH_TERM, PAGES_TO_SCRAPE).scrape_reviews
    parsed_reviews = Parser.parse_html(review_pages)
    analyzed_reviews = analyze_reviews(parsed_reviews)

    Printer.new(analyzed_reviews).print_overly_excited_reviews
  end

  private_class_method def self.analyze_reviews(reviews)
    reviews.map do |review_node|
      review  = Review.new(review_node)
      severity_degree = Analyzer.new(review).analyze

      { user: review.owner, title: review.title, severity: severity_degree }
    end
  end
end
