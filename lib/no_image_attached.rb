require_relative 'base_severity'

class NoImageAttached < BaseSeverity
  NO_IMAGE_ATTACHED_OFFENSE = 2

  def initialize(review)
    super(review)
  end

  def severity
    return ZERO if @review.image?

    NO_IMAGE_ATTACHED_OFFENSE
  end
end
