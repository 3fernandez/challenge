class NullReview
  RATING_KEYS = %w[customer_service quality_of_work friendliness pricing overall_experience].freeze

  def dealer_rating
    0
  end

  def owner
    'Not Found'
  end

  def title
    'Not Found'
  end

  def all_ratings
    build_ratings_object
  end

  private

  def build_ratings_object
    RATING_KEYS.each_with_object({}) { |key, hash| hash[key.to_sym] = 0 }
  end
end
