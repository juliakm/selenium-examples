# filename: springboard_donate.rb
require 'selenium-webdriver'
require_relative 'donate'

  describe 'Donate' do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @donate = Donate.new(@driver)
    end

    after(:each) do
      @driver.quit
    end

  it 'succeeded' do
    @donate.with('Julia', 'Tester', 'julia.kulla-mader+test@jacksonriver.com','111 Testing Lane', 'Durham', 'United States', 'California', '27705', '4111111111111111', '2017','123')
    expect(@donate.success_message_present?).to eql true
  end

  it 'failed' do
    @donate.with('Julia', 'Tester', 'julia.kulla-mader+test@jacksonriver.com','111 Testing Lane', 'Durham', 'United States', 'North Carolina', '27705', '0000000000000000', '2016','123')
    expect(@donate.failure_message_present?).to eql true
  end

end
