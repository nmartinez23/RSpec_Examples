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
  end
end
