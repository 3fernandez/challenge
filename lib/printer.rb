class Printer
  def initialize(analyzed_reviews)
    @analyzed_reviews = analyzed_reviews
  end

  def print_overly_excited_reviews
    puts '          User          |               Review Title               | Severity '
    puts '------------------------------------------------------------------------------'

    sort_reviews.each do |review|
      puts "#{review[:user]}  |  #{review[:title]}  |  #{review[:severity]}"
    end
  end

  private

  def sort_reviews
    sorted_reviews = @analyzed_reviews.sort_by { |review| review[:severity] }
    sorted_reviews.reverse.first(3)
  end
end
