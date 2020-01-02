require_relative '../spec_helper'
require_relative '../../lib/scraper'

describe Scraper do
  subject { described_class.new(base_url, search_term, pages_to_scrape) }

  xcontext 'with a valid URL' do
    let(:base_url) { 'https://www.dealerrater.com' }
    let(:search_term) { 'McKaig Chevrolet Buick' }
    let(:pages_to_scrape) { 1 }
    let(:reviews_array_size) { 10 }

    describe '#scrape_reviews' do
      let(:scraped_reviews) { subject.send(:scrape_reviews) }

      it 'should return a String' do
        expect(scraped_reviews).to be_a_kind_of(String)
      end

      it 'should not be empty' do
        expect(scraped_reviews).to_not be('')
      end
    end

    describe '#navigate_to_the_given_url' do
      let(:navigate_to_the_given_url) { subject.send(:navigate_to_the_given_url) }

      it 'should not be empty' do
        expect(navigate_to_the_given_url).to_not be('')
      end

      it 'should return the base_url' do
        expect(navigate_to_the_given_url).to eq base_url
      end
    end

    describe '#navigate_to_reviews_section' do
      before do
        subject.send(:navigate_to_the_given_url)
      end

      it 'should change Watir url instance method' do
        expect {
          subject.send(:navigate_to_reviews_section)
        }.to change { subject.instance_variable_get(:@browser).url }
      end
    end

    describe '#search_review_pages' do
      before do
        subject.send(:navigate_to_the_given_url)
        subject.send(:navigate_to_reviews_section)
      end

      let(:fetched_reviews) { subject.send(:search_review_pages) }

      it 'should return a String' do
        expect(fetched_reviews).to be_a_kind_of(String)
      end

      it 'should not be empty' do
        expect(fetched_reviews).to_not be('')
      end
    end
  end

  xcontext 'with an invalid URL' do
    let(:base_url) { 'https://noplacetogo' }
    let(:search_term) { 'McKaig Chevrolet Buick' }
    let(:pages_to_scrape) { 1 }

    describe '#scrape_reviews' do
      it 'should not change Watir html instance method' do
        expect {
          subject.send(:scrape_reviews)
        }.to_not change { subject.instance_variable_get(:@browser).html }
      end
    end
  end
end
