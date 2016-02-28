# filename: donate.rb
require_relative 'base_form'

class Donate < BaseForm
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
    super
    visit 'http://49.qa.jacksonriverdev.com'
    raise 'Form not ready' unless
      is_displayed?(DONATE_FORM)
    end

  def with(firstname, lastname, email, address, city, country, state, postalcode, creditcardnum, creditexp, creditcvv)
    type firstname, FIRST_NAME
    type lastname, LAST_NAME
    type email, EMAIL
    type address, ADDRESS
    type city, CITY
    type postalcode, POSTAL_CODE
    type creditcardnum, CREDIT_CARD_NUM
    type creditcvv, CREDIT_CVV
    dropdown state, STATE
    dropdown country, COUNTRY
    dropdown creditexp, CREDIT_EXP

    #STATE
#    dropdown state, STATE

    # state_dropdown = @driver.find_element(STATE)
    # select_list = Selenium::WebDriver::Support::Select.new(state_dropdown)
    # select_list.select_by(:text, state)

    #COUNTRY
    # country_dropdown = @driver.find_element(COUNTRY)
    # select_list = Selenium::WebDriver::Support::Select.new(country_dropdown)
    # select_list.select_by(:text, country)
    #
    # #dropdown creditexp, CREDIT_EXP
    # # #CC EXPIRATION
    # ccexp_dropdown = @driver.find_element(CREDIT_EXP)
    # select_list = Selenium::WebDriver::Support::Select.new(ccexp_dropdown)
    # select_list.select_by(:text, creditexp)


    @driver.find_element(SUBMIT_BUTTON).click
  end

  def success_message_present?
    is_displayed? SUCCESS_MESSAGE
  end

  def failure_message_present?
    is_displayed? FAILURE_MESSAGE
  end

end
