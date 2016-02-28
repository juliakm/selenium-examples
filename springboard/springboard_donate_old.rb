
# filename: login_spec.rb

require 'selenium-webdriver'

describe 'Login' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
  end

  after(:each) do
    @driver.quit
  end

  it 'succeeded' do
    @driver.get 'http://49.qa.jacksonriverdev.com/'
    #@driver.get 'https://hmac.qa.jacksonriverdev.com/node/2'

    #Your Information
    @driver.find_element(id: 'edit-submitted-donor-information-first-name').send_keys('Julia')
    @driver.find_element(id: 'edit-submitted-donor-information-last-name').send_keys('Kulla-Mader')
    @driver.find_element(id: 'edit-submitted-donor-information-mail').send_keys('julia.kulla-mader+robot@jacksonriver.com')

    #Billing Information
    @driver.find_element(id: 'edit-submitted-billing-information-address').send_keys('930 Ferncrest Drive')
    @driver.find_element(id: 'edit-submitted-billing-information-city').send_keys('Durham')

    #Billing Information - Country
    dropdown = @driver.find_element(id: 'edit-submitted-billing-information-country')
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:text, "United States")

    #Billing Information - State
    state_dropdown = @driver.find_element(id: 'edit-submitted-billing-information-state')
    select_list = Selenium::WebDriver::Support::Select.new(state_dropdown)
    select_list.select_by(:text, "North Carolina")

    #Postal Code
    @driver.find_element(id: 'edit-submitted-billing-information-zip').send_keys('27705')

    #Payment Information
    @driver.find_element(id: 'edit-submitted-payment-information-payment-fields-credit-card-number').send_keys('4111111111111111')
    @driver.find_element(id: 'edit-submitted-payment-information-payment-fields-credit-expiration-date-card-expiration-year').send_keys('2017')
    @driver.find_element(id: 'edit-submitted-payment-information-payment-fields-credit-card-cvv').send_keys('123')
    #@driver.find_element(id: 'edit-submitted-payment-information-recent-donors-list-optin-1').click

    @driver.find_element(:id, "edit-submitted-payment-information-recent-donors-list-optin-1").click


    #Submit form
    @driver.find_element(id: 'edit-submit').submit
    expect(@driver.find_element(css: '.alert.status').displayed?).to eql true
      # if verify{@driver.find_element(:css, '.alert.status').text.include?("successfully processed")}
      #   puts "Text is on the page"
      # else "Text is not present"
      # end

  end
end
