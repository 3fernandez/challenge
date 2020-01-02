require_relative '../spec_helper'
require_relative '../support/mocked_review_node'
require_relative '../../lib/analyzer'
require_relative '../../lib/review'

describe Analyzer do
  subject { described_class.new(review) }

  context 'with a valid review node' do
    let(:mocked_review_node) { MockedReviewNode.review_node }
    let(:review) { Review.new(mocked_review_node) }

    describe '#analyze' do
      it 'should be present' do
        expect(subject.analyze).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.analyze).to be_a_kind_of(Integer)
      end

      it 'should be equal to 3' do
        expect(subject.analyze).to eq(6)
      end
    end
  end

  context 'with an invalid review node' do
    let(:mocked_review_node) { MockedReviewNode.empty_review_node }
    let(:review) { Review.new(mocked_review_node) }

    describe '#analyze' do
      it 'should be present' do
        expect(subject.analyze).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.analyze).to be_a_kind_of(Integer)
      end

      it 'should be equal to 0' do
        expect(subject.analyze).to eq(2)
      end
    end
  end
end
