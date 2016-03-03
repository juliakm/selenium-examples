# filename: spec_springboard_donate.rb
require 'faker'
require_relative 'spec_helper'
require_relative '../pages/ticketed_event'

  describe 'Ticketed Event' do

    before(:each) do
      @ticketed_event = TicketedEvent.new(@driver)
    end

  it 'ticketed event WITH add-on donation' do
    @ticketed_event.with('7','0','55',Faker::Name.first_name, Faker::Name.last_name, "julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com",Faker::Address.street_address, 'Durham', 'United States', 'California', Faker::Address.postcode, '4111111111111111', '2017','123')
    expect(@ticketed_event.success_message_present?).to eql true
  end

  it 'ticketed event WITHOUT add-on donation' do
    @ticketed_event.with('2','0','0',Faker::Name.first_name, Faker::Name.last_name, "julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com",Faker::Address.street_address, 'Durham', 'United States', 'California', Faker::Address.postcode, '4111111111111111', '2017','123')
    expect(@ticketed_event.success_message_present?).to eql true
  end

end
