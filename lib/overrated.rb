require_relative 'base_severity'

class Overrated < BaseSeverity
  FIVE_STAR_OFFENSE = 1

  def initialize(review)
    super(review)
  end

  def severity
    return FIVE_STAR_OFFENSE if overrated?

    ZERO
  end
end
