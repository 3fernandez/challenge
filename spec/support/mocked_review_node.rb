require 'nokogiri'

class MockedReviewNode
  def self.raw_review_node
    file
  end

  def self.review_node
    nokogiri_document = Nokogiri::HTML(file)
    nokogiri_document.search('div.review-entry')
  end

  def self.empty_review_node
    builder = Nokogiri::HTML::Builder.new do |doc|
      doc.html {
        doc.body(onload: 'some_func();') {
          doc.span.bold {
            doc.text "It's empty"
          }
        }
      }
    end

    builder.doc
  end

  private_class_method def self.file
    File.open(File.expand_path('./spec/fixtures/mocked_review_node.txt')).read
  end
end
