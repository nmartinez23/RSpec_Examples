require 'spec_helper'
require 'set'
require 'card'

describe Card do
  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    # Card.new(**defaults.merge(params))
    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

# RSpec.describe 'a playing card' do
  it 'has a suit' do
    # raise unless Card.new(suit: :spades, rank: 4).suit == :spades
    raise unless card(suit: :spades).suit == :spades
  end

  it 'has a rank' do
    # raise unless Card.new(suit: :spades, rank: 4).rank == 4
    raise unless card(rank: 4).rank == 4
  end

  context 'equality' do
    # def subject
    #   @subject ||= card(suit: :spades, rank: 4)
    # end
    subject { card(suit: :spades, rank: 4) }

    describe 'comparing against self' do
      # def other
      #   @other ||= card(suit: :spades, rank: 4)
      # end
      let(:other) { card(suit: :spades, rank: 4) }

      it 'is equal' do
    # it 'is equal to itself' do
      # subject = card(suit: :spades, rank: 4)
      # other = card(suit: :spades, rank: 4)

        raise unless subject == other
      end

      it 'is hash equal' do
    # it 'is hash equal to itself' do
      # subject = card(suit: :spades, rank: 4)
      # other = card(suit: :spades, rank: 4)

        raise unless Set.new([subject, other]).size == 1
      end
    end

    shared_examples_for 'an unequal card' do
      it 'is not equal' do
        raise unless subject != other
      end

      it 'is not hash equal' do
        raise unless Set.new([subject, other]).size == 2
      end
    end

    describe 'comparing to a card of differing suit' do
      # def other
      #   @other ||= card(suit: :hearts, rank: 4)
      # end
      let(:other) { card(suit: :hearts, rank: 4) }

      it_behaves_like 'an unequal card'
    end
      # it 'is not equal' do
        # subject = card(suit: :spades, rank: 4)
        # other = card(suit: :hearts, rank: 4)

        # raise unless subject != other
      # end
    # it 'is not equal to a card of differing suit' do
    #   subject = card(suit: :spades, rank: 4)
    #   other = card(suit: :hearts, rank: 4)

    #   raise unless subject != other
    # end
      # it 'is not hash equal' do
        # subject = card(suit: :spades, rank: 4)
        # other = card(suit: :hearts, rank: 4)

        # raise unless Set.new([subject, other]).size == 2
      # end

    # it 'is not hash equal to a card of differing suit' do
    #   subject = card(suit: :spades, rank: 4)
    #   other = card(suit: :hearts, rank: 4)

    #   raise unless Set.new([subject, other]).size == 2
    # end

    describe 'comparing to a card of differing rank' do
      # def other
        # @other ||= card(suit: :spades, rank: 5)
      # end
      let(:other) { card(suit: :spades, rank: 5) }

      it_behaves_like 'an unequal card'
    end
  end

      # it 'is not equal' do
        # subject = card(suit: :spades, rank: 4)
        # other = card(suit: :spades, rank: 5)

        # raise unless subject != other
      # end

    # it 'is not equal to a card of differing rank' do
    #   subject = card(suit: :spades, rank: 4)
    #   other = card(suit: :spades, rank: 5)

    #   raise unless subject != other
    # end

      # it 'is not hash' do
        # subject = card(suit: :spades, rank: 4)
        # other = card(suit: :spades, rank: 5)

        # raise unless Set.new([subject, other]).size == 2
      # end
    # end
  # end
    # it 'is not hash equal to a card of differing rank' do
    #   subject = card(suit: :spades, rank: 4)
    #   other = card(suit: :spades, rank: 5)

    #   raise unless Set.new([subject, other]).size == 2
    # end

  describe 'a jack' do
    # it 'ranks higher than a 10' do
    #   lower = Card.new(suit: :spades, rank: 10)
    #   higher = Card.new(suit: :spades, rank: :jack)
    it 'ranks higher than a 10' do
      lower = card(rank: 10)
      higher = card(rank: :jack)
      raise unless higher.rank > lower.rank
    end
  end

  describe 'a queen' do
    # it 'ranks higher than a jack' do
    #   lower = Card.new(suit: :spades, rank: :jack)
    #   higher = Card.new(suit: :spades, rank: :queen)
    it 'ranks higher than a jack' do
      lower = card(rank: :jack)
      higher = card(rank: :queen)
      raise unless higher.rank > lower.rank
    end
  end

  describe 'a king' do
    # it 'ranks higher than a queen' do
    #   lower = Card.new(suit: :spades, rank: :queen)
    #   higher = Card.new(suit: :spades, rank: :king)
    it 'ranks higher than a queen' do
      lower = card(rank: :queen)
      higher = card(rank: :king)
      raise unless higher.rank > lower.rank
    end
  end
end
