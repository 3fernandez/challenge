require_relative '../spec_helper'
require_relative '../support/mocked_review_node'
require_relative '../../lib/review'

describe Review do
  subject { described_class.new(mocked_review_node) }

  context 'with a valid review node' do
    let(:mocked_review_node) { MockedReviewNode.review_node }

    describe '#dealer_rating' do
      it 'should be present' do
        expect(subject.dealer_rating).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.dealer_rating).to be_a_kind_of(Integer)
      end
    end

    describe '#owner' do
      it 'should be present' do
        expect(subject.owner).to_not be_nil
      end

      it 'should be a String' do
        expect(subject.owner).to be_a_kind_of(String)
      end
    end

    describe '#image?' do
      it 'should be present' do
        expect(subject.image?).to_not be_nil
      end

      it 'should be a kind of Object' do
        expect(subject.image?).to be_a_kind_of(Object)
      end

      it 'should be false' do
        expect(subject.image?).to be false
      end
    end

    describe '#title' do
      it 'should be present' do
        expect(subject.title).to_not be_nil
      end

      it 'should be a String' do
        expect(subject.title).to be_a_kind_of(String)
      end
    end

    describe '#all_ratings' do
      it 'should be present' do
        expect(subject.all_ratings).to_not be_nil
      end

      it 'should be a Hash object' do
        expect(subject.all_ratings).to be_a_kind_of(Hash)
      end
    end
  end

  context 'with a valid review node' do
    let(:mocked_review_node) { MockedReviewNode.empty_review_node }

    describe '#dealer_rating' do
      it 'should be present' do
        expect(subject.dealer_rating).to_not be_nil
      end

      it 'should be an Integer' do
        expect(subject.dealer_rating).to be_a_kind_of(Integer)
      end
    end

    describe '#owner' do
      it 'should be present' do
        expect(subject.owner).to_not be_nil
      end

      it 'should be a String' do
        expect(subject.owner).to be_a_kind_of(String)
      end
    end

    describe '#image?' do
      it 'should be present' do
        expect(subject.image?).to_not be_nil
      end

      it 'should be a kind of Object' do
        expect(subject.image?).to be_a_kind_of(Object)
      end

      it 'should be false' do
        expect(subject.image?).to be false
      end
    end

    describe '#title' do
      it 'should be present' do
        expect(subject.title).to_not be_nil
      end

      it 'should be a String' do
        expect(subject.title).to be_a_kind_of(String)
      end
    end

    describe '#all_ratings' do
      it 'should be present' do
        expect(subject.all_ratings).to_not be_nil
      end

      it 'should be a Hash object' do
        expect(subject.all_ratings).to be_a_kind_of(Hash)
      end
    end
  end
end
