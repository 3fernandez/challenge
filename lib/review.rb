require_relative 'null_review'
require 'nokogiri'

class Review
  RATING_KEYS = %w[customer_service quality_of_work friendliness pricing overall_experience].freeze

  def initialize(review_node)
    @review_node = review_node
    @null_review = NullReview.new
  end

  def dealer_rating
    rating = @review_node.at('div.rating-static')
    rating ? rating.classes[4][-2, 2].to_i : @null_review.dealer_rating
  end

  def owner
    owner = @review_node.at('span.black')
    owner ? owner.text.split(' ').drop(1).join(' ') : @null_review.owner
  end

  def image?
    @review_node.at('img.pointer') ? true : false
  end

  def title
    title = @review_node.at('h3.no-format')
    title ? title.text : @null_review.title
  end

  def all_ratings
    build_ratings_object
  end

  private

  def build_ratings_object
    ratings_values = fetch_ratings
    return @null_review.all_ratings if ratings_values.empty?

    RATING_KEYS.each_with_object({}).with_index do |(key, hash), index|
      hash[key.to_sym] = ratings_values[index]
    end
  end

  def fetch_ratings
    @review_node.search('div.rating-static-indv').map do |rating|
      rating.classes[1][-2, 2].to_i
    end
  end
end
