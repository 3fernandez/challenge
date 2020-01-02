class BaseSeverity
  FIVE_STAR_RATING  = 50
  ZERO              = 0

  def initialize(review)
    @review = review
  end

  private

  def overrated?
    @review.dealer_rating == FIVE_STAR_RATING && overall_experience_equal_to_five?
  end

  def overall_experience_equal_to_five?
    @review.all_ratings[:overall_experience] == FIVE_STAR_RATING
  end

  def any_under_five_stars?
    first_four_rating_stars.any? { |_key, value| value < FIVE_STAR_RATING }
  end

  def all_five_stars?
    first_four_rating_stars.all? { |_key, value| value == FIVE_STAR_RATING }
  end

  def first_four_rating_stars
    @review.all_ratings.first(4).to_h
  end
end
