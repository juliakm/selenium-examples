# filename: spec_springboard_donate.rb
require 'faker'
#require 'selenium-webdriver'
require_relative 'spec_helper'
require_relative '../pages/donate'

  describe 'Donate' do

    before(:each) do
      @donate = Donate.new(@driver)
    end

  it 'one-time succeeded' do
    @donate.with(Faker::Name.first_name, Faker::Name.last_name, "julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com",Faker::Address.street_address, 'Durham', 'United States', 'California', Faker::Address.postcode, '4111111111111111', '2017','123','0')
    expect(@donate.success_message_present?).to eql true
  end

  it 'recurring succeeded' do
    @donate.with(Faker::Name.first_name, Faker::Name.last_name, "julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com",Faker::Address.street_address, 'Durham', 'United States', 'California', Faker::Address.postcode, '4111111111111111', '2017','123','1')
    expect(@donate.success_message_present?).to eql true
  end

  it 'failed' do
    @donate.with('Julia', 'Tester', 'julia.kulla-mader+test@jacksonriver.com','111 Testing Lane', 'Durham', 'United States', 'North Carolina', '27705', '0000000000000000', '2016','123','1')
    expect(@donate.failure_message_present?).to eql true
  end

end
