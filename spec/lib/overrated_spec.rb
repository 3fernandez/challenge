require_relative '../spec_helper'
require_relative '../support/mocked_review_node'
require_relative '../../lib/overrated'
require_relative '../../lib/review'

describe Overrated do
  subject { described_class.new(review) }

  context 'with a valid review node' do
    let(:mocked_review_node) { MockedReviewNode.review_node }
    let(:review) { Review.new(mocked_review_node) }

    describe '#severity' do
      it 'should be present' do
        expect(subject.severity).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.severity).to be_a_kind_of(Integer)
      end

      it 'should be equal to 1' do
        expect(subject.severity).to eq(1)
      end
    end
  end

  context 'with an invalid review node' do
    let(:mocked_review_node) { MockedReviewNode.empty_review_node }
    let(:review) { Review.new(mocked_review_node) }

    describe '#severity' do
      it 'should be present' do
        expect(subject.severity).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.severity).to be_a_kind_of(Integer)
      end

      it 'should be equal to 0' do
        expect(subject.severity).to eq(0)
      end
    end
  end
end
