require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do 
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
   end
  describe '#initialize' do 
    it 'is created as an instance of Attendee' do
      expect(@attendee).to be_a(Attendee)
    end
    it 'is created with a name' do
      expect(@attendee.name).to eq('Megan')
    end
    it 'is created with a budget' do
      expect(@attendee.budget).to eq('$50')
    end
  end
end 