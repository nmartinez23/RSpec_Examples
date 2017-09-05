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
end
