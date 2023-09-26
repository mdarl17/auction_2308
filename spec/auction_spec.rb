require 'date'
require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before(:each) do 
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
  end

  describe '#initialize' do 
    it 'is created as an instance of Auction' do
      expect(@auction).to be_a(Auction)
    end
    it 'is created with an empty array of items' do
      auction1 = Auction.new
      expect(auction1.items).to eq([])
    end
    it 'is created with the date is instantiated' do
      mock_date = double("date")
      allow(mock_date).to receive(:date).and_return('09/25/2023')
    end

  end

  describe '#add_item' do 
    it 'adds items to a list of auction items' do
      expect(@auction.items).to eq([@item1, @item2, @item3, @item4, @item5])
    end
  end

  describe '#item_names' do
    it 'returns a list of item names being sold at auction' do
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame', 'Homemade Chocolate Chip Cookies', '2 Days Dogsitting', 'Forever Stamps'])
    end
  end

  describe '#unpopular_items' do
    it 'returns a list of items that have no bids' do
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end

  describe '#potential_revenue' do 
    it 'calculates the CURRENT potential revenue of items at auction (that currently have a bid)' do
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end
  
  describe '#bidders' do
    it 'returns a list of bidders' do 
      expect(@auction.bidders).to eq(['Bob', 'Megan', 'Mike'])
    end
  end

  describe '#bidder_info' do 
    it 'returns a hash with attendees and their respective budgets and items on which they have currently bid' do
      expect(@auction.bidder_info).to eq({@attendee2 => {budget: '$75', items: @item1}, @attendee1 => {budget: '$50', items: @item1}, @attendee3 => {budget: '$100', items: @item4}})
    end
  end
end 