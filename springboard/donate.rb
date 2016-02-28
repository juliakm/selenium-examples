# filename: donate.rb
class Donate
  DONATE_FORM = { class: 'node-type-donation-form' }
  SUBMIT_BUTTON   = { id: 'edit-submit'  }
  SUCCESS_MESSAGE = { css: '.alert.status' }
  FAILURE_MESSAGE = { css: '.alert.error' }
  FIRST_NAME = { id: 'edit-submitted-donor-information-first-name' }
  LAST_NAME  = { id: 'edit-submitted-donor-information-last-name' }
  EMAIL  = { id: 'edit-submitted-donor-information-mail' }
  ADDRESS  = { id: 'edit-submitted-billing-information-address' }
  CITY  = { id: 'edit-submitted-billing-information-city' }
  COUNTRY = { id: 'edit-submitted-billing-information-country' }
  STATE = { id: 'edit-submitted-billing-information-state' }
  POSTAL_CODE = { id: 'edit-submitted-billing-information-zip' }
  CREDIT_CARD_NUM = { id: 'edit-submitted-payment-information-payment-fields-credit-card-number' }
  CREDIT_EXP = { id: 'edit-submitted-payment-information-payment-fields-credit-expiration-date-card-expiration-year' }
  CREDIT_CVV = { id: 'edit-submitted-payment-information-payment-fields-credit-card-cvv' }

  def initialize(driver)
    @driver = driver
    @driver.get 'http://49.qa.jacksonriverdev.com'
    # raise 'Donation form not visible' unless
    #   @driver.find_element(LOGIN_FORM).displayed?
    end

  def with(firstname, lastname, email, address, city, country, state, postalcode, creditcardnum, creditexp, creditcvv)
    @driver.find_element(FIRST_NAME).send_keys(firstname)
    @driver.find_element(LAST_NAME).send_keys(lastname)
    @driver.find_element(EMAIL).send_keys(email)
    @driver.find_element(ADDRESS).send_keys(address)
    @driver.find_element(CITY).send_keys(city)
    @driver.find_element(POSTAL_CODE).send_keys(postalcode)
    @driver.find_element(CREDIT_CARD_NUM).send_keys(creditcardnum)
    @driver.find_element(CREDIT_CVV).send_keys(creditcvv)

    #STATE
    state_dropdown = @driver.find_element(STATE)
    select_list = Selenium::WebDriver::Support::Select.new(state_dropdown)
    select_list.select_by(:text, state)

    #COUNTRY
    country_dropdown = @driver.find_element(COUNTRY)
    select_list = Selenium::WebDriver::Support::Select.new(country_dropdown)
    select_list.select_by(:text, country)

    #CC EXPIRATION
    ccexp_dropdown = @driver.find_element(CREDIT_EXP)
    select_list = Selenium::WebDriver::Support::Select.new(ccexp_dropdown)
    select_list.select_by(:text, creditexp)


    @driver.find_element(SUBMIT_BUTTON).click
  end

  def success_message_present?
    @driver.find_element(SUCCESS_MESSAGE).displayed?
  end

  def failure_message_present?
    @driver.find_element(FAILURE_MESSAGE).displayed?
  end

end
