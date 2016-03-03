# filename: ticketed_event.rb
require_relative 'base_form'

class TicketedEvent < BaseForm
  DONATE_FORM = { class: 'node-type-ticketed-event' }
  TICKET_ONE = {id: 'product-28-ticket-quant'}
  TICKET_TWO = {id: 'product-29-ticket-quant'}
  ADDITIONAL_DONATION = { id: 'fundraiser-tickets-extra-donation' }
  SUBMIT_BUTTON   = { id: 'edit-submit'  }
  SUCCESS_MESSAGE = { css: '.webform-confirmation' }
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
  RECURRING = { id: 'edit-submitted-payment-information-recurs-monthly-1' }

  def initialize(driver)
    super
    visit '/node/137'
    raise 'Form not ready' unless
      is_displayed?(DONATE_FORM)
    end

  def with(ticketone, tickettwo, additionaldonation, firstname, lastname, email, address, city, country, state, postalcode, creditcardnum, creditexp, creditcvv)
    dropdown ticketone, TICKET_ONE
    dropdown tickettwo, TICKET_TWO
    type additionaldonation, ADDITIONAL_DONATION
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

    @driver.find_element(SUBMIT_BUTTON).click
  end

  def success_message_present?
    wait_for(10) { is_displayed? SUCCESS_MESSAGE }
  end

  def failure_message_present?
    is_displayed? FAILURE_MESSAGE
  end

end
