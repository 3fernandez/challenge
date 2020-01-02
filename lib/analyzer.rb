require_relative 'overrated'
require_relative 'no_image_attached'
require_relative 'inconsistent_rating'

class Analyzer
  def initialize(review)
    @review = review
    @severity_degree = 0
  end

  def analyze
    @severity_degree += Overrated.new(@review).severity
    @severity_degree += NoImageAttached.new(@review).severity
    @severity_degree += InconsistentRating.new(@review).severity
  end
end
