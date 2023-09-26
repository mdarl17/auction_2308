require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do 
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
  end

  describe '#initialize' do 
    it 'is created as an instance of Item' do
      expect(@item1).to be_a(Item)
    end
    it 'is created with a name' do 
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
    it 'is created with an empty hash of bids' do
      item = Item.new('Chalkware Piggy Bank')
      expect(item.bids).to eq({})
    end
  end

  describe '#add_bid' do
    it 'adds bids on items to a list of bids' do 
      expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
    end
  end

  describe '#current_high_bid' do 
    it 'returns an item\'s highest bid' do
      expect(@item1.current_high_bid).to eq(22)
    end
  end

end 