require_relative '../spec_helper'
require_relative '../support/mocked_review_node'
require_relative '../../lib/controller'
require_relative '../../lib/scraper'
require_relative '../../lib/parser'

describe Controller do
  subject { described_class }

  let(:base_url) { 'https://www.dealerrater.com' }
  let(:search_term) { 'McKaig Chevrolet Buick' }
  let(:pages_to_scrape) { 1 }
  let(:scraper) { Scraper.new(base_url, search_term, pages_to_scrape) }

  context 'with a valid review node' do
    let(:mocked_raw_review_node) { MockedReviewNode.raw_review_node }
    let(:mocked_review_node) { MockedReviewNode.review_node }

    describe '#show_overly_excited_reviews' do
      before :each do
        allow_any_instance_of(Scraper).to receive(:scrape_reviews).and_return(mocked_raw_review_node)
        allow_any_instance_of(Parser).to receive(:parse_html).and_return(mocked_review_node)
      end

      it 'returns an analized_review' do
        expect(subject.show_overly_excited_reviews).to_not be_nil
      end

      it 'returns an analized_review within an Array' do
        expect(subject.show_overly_excited_reviews).to be_a_kind_of(Array)
      end
    end
  end

  context 'with a invalid review node' do
    describe '#show_overly_excited_reviews' do
      before :each do
        allow_any_instance_of(Scraper).to receive(:scrape_reviews).and_return('')
        allow_any_instance_of(Parser).to receive(:parse_html).and_return([])
      end

      it 'returns an analized_review' do
        expect(subject.show_overly_excited_reviews).to_not be_nil
      end

      it 'returns an analized_review within an Array' do
        expect(subject.show_overly_excited_reviews).to be_a_kind_of(Array)
      end
    end
  end
end

