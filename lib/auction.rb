require 'date'

class Auction

  attr_reader :items, :date

  def initialize
    @items = []
    @date = Date.today.strftime("%m/%d/%Y")
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    @items.reduce(0) do |revenue, item|
      if item.current_high_bid
        revenue += item.current_high_bid
      end
      revenue
    end
  end

  def bidders
    @items.flat_map do |item|
      item.bids.keys.map do |attendee|
        attendee.name
      end
    end
  end

  def bidder_info
    bidder_info_hash = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if bidder_info_hash[attendee]
          bidder_info_hash[:items] << item
        else
          bidder_info_hash[attendee] = {budget: attendee.budget, items: item}
        end
      end
    end
    bidder_info_hash
  end

  def close_auction
    bidder_info.each do |attendee, budget_items|
      budget_items[:item.each] |key, val|
    end
  end
end