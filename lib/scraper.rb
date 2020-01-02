require 'watir'
require 'webdrivers'
require 'nokogiri'

class Scraper
  def initialize(base_url, search_term, pages_to_scrape)
    @browser          = Watir::Browser.new(:chrome, headless: true)
    @base_url         = base_url
    @search_term      = search_term
    @pages_to_scrape  = pages_to_scrape
  end

  def scrape_reviews
    navigate_to_the_given_url
    return unless searchable?
    navigate_to_reviews_section
    search_review_pages
  end

  private

  def navigate_to_the_given_url
    @browser.goto(@base_url)
  end

  def searchable?
    @browser.div(id: 'searchContainer').exists? ? true : false
  end

  def navigate_to_reviews_section
    @browser.div(id: 'searchContainer').wait_until(&:present?).click
    @browser.text_field(id: 'mobileAutoComplete').set(@search_term)
    @browser.ul(id: 'ui-id-2').li.wait_until(&:present?).click
    @browser.div(id: 'link').as[2].wait_until(&:present?).click
  end

  def search_review_pages
    pagination_count = 0
    review_pages = ''

    while pagination_count < @pages_to_scrape
      review_pages << @browser.html
      @browser.div(class: ['page_active', 'next']).a.click
      pagination_count += 1
    end

    review_pages
  end
end
