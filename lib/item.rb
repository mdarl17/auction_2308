class Item
  attr_reader :name, :bids, :closed

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @closed = false
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @closed = true
  end

end