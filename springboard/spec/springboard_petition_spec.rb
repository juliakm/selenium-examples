# filename: spec_springboard_donate.rb
require 'faker'
require_relative 'spec_helper'
require_relative '../pages/petition'

  describe 'Petition' do

    before(:each) do
      @petition = Petition.new(@driver)
    end

  it 'petition without quicksign with signature' do
    @petition.with("julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com", Faker::Name.first_name, Faker::Name.last_name, '1')
    expect(@petition.success_message_present?).to eql true
  end

  it 'petition without quicksign without signature' do
    @petition.with("julia.kulla-mader+#{rand(252...4350)}@jacksonriver.com", Faker::Name.first_name, Faker::Name.last_name, '0')
    expect(@petition.success_message_present?).to eql true
  end

  it 'quicksign petition' do
    @petition.quicksign("jr+ref_sbeditor@jacksonriver.com")
    expect(@petition.success_message_present?).to eql true
  end
end
