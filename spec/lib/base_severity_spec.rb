require_relative '../spec_helper'
require_relative '../support/mocked_review_node'
require_relative '../../lib/base_severity'
require_relative '../../lib/review'

describe BaseSeverity do
  subject { described_class.new(review) }

  describe '#overrated?' do
    context 'with a valid review node' do
      let(:mocked_review_node) { MockedReviewNode.review_node }
      let(:review) { Review.new(mocked_review_node) }
      let(:overrated?) { subject.send(:overrated?) }

      it 'should be present' do
        expect(overrated?).to_not be_nil
      end

      it 'should be true' do
        expect(overrated?).to be true
      end
    end

    context 'with an invalid review node' do
      let(:mocked_review_node) { MockedReviewNode.empty_review_node }
      let(:review) { Review.new(mocked_review_node) }
      let(:overrated?) { subject.send(:overrated?) }

      it 'should be present' do
        expect(overrated?).to_not be_nil
      end

      it 'should be false' do
        expect(overrated?).to be false
      end
    end
  end

  describe '#overall_experience_equal_to_five?' do
    context 'with a valid review node' do
      let(:mocked_review_node) { MockedReviewNode.review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:overall_experience_equal_to_five?)).to_not be_nil
      end

      it 'should be true' do
        expect(subject.send(:overall_experience_equal_to_five?)).to be true
      end
    end

    context 'with an invalid review node' do
      let(:mocked_review_node) { MockedReviewNode.empty_review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:overall_experience_equal_to_five?)).to_not be_nil
      end

      it 'should be false' do
        expect(subject.send(:overall_experience_equal_to_five?)).to be false
      end
    end
  end

  describe '#any_under_five_stars?' do
    context 'with a valid review node' do
      let(:mocked_review_node) { MockedReviewNode.review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:any_under_five_stars?)).to_not be_nil
      end

      it 'should be true' do
        expect(subject.send(:any_under_five_stars?)).to be true
      end
    end

    context 'with an invalid review node' do
      let(:mocked_review_node) { MockedReviewNode.empty_review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:any_under_five_stars?)).to_not be_nil
      end

      it 'should be true' do
        expect(subject.send(:any_under_five_stars?)).to be true
      end
    end
  end

  describe '#all_five_stars?' do
    context 'with a valid review node' do
      let(:mocked_review_node) { MockedReviewNode.review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:all_five_stars?)).to_not be_nil
      end

      it 'should be false' do
        expect(subject.send(:all_five_stars?)).to be false
      end
    end

    context 'with an invalid review node' do
      let(:mocked_review_node) { MockedReviewNode.empty_review_node }
      let(:review) { Review.new(mocked_review_node) }

      it 'should be present' do
        expect(subject.send(:all_five_stars?)).to_not be_nil
      end

      it 'should be false' do
        expect(subject.send(:all_five_stars?)).to be false
      end
    end
  end

  describe '#first_four_rating_stars' do
    context 'with a valid review node' do
      let(:mocked_review_node) { MockedReviewNode.review_node }
      let(:review) { Review.new(mocked_review_node) }
      let(:first_four_rating_stars) { subject.send(:first_four_rating_stars) }

      it 'should be present' do
        expect(first_four_rating_stars).to_not be_nil
      end

      it 'should be a kind of Hash' do
        expect(first_four_rating_stars).to be_a_kind_of(Hash)
      end

      it 'should be of size 4' do
        expect(first_four_rating_stars.size).to be(4)
      end
    end

    context 'with an invalid review node' do
      let(:mocked_review_node) { MockedReviewNode.empty_review_node }
      let(:review) { Review.new(mocked_review_node) }
      let(:first_four_rating_stars) { subject.send(:first_four_rating_stars) }

      it 'should be present' do
        expect(first_four_rating_stars).to_not be_nil
      end

      it 'should be a kind of Hash' do
        expect(first_four_rating_stars).to be_a_kind_of(Hash)
      end

      it 'should be of size 4' do
        expect(first_four_rating_stars.size).to be(4)
      end
    end
  end
end
