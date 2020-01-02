require_relative 'base_severity'

class InconsistentRating < BaseSeverity
  INCONSISTENT_RATINGS_OFFENSE  = 3

  def initialize(review)
    super(review)
  end

  def severity
    return INCONSISTENT_RATINGS_OFFENSE if inconsistent?

    ZERO
  end

  private

  def inconsistent?
    any_under_five_stars? && overall_experience_equal_to_five?
  end
end
