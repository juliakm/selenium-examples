# filename: petition.rb
require_relative 'base_form'

class Petition < BaseForm
  PETITION_FORM = { class: 'node-type-springboard-petition' }
  QUICKSIGN_EMAIL  = { id: 'edit-submitted-sba-quicksign-children-qsign-quicksign-mail' }
  QUICKSIGN_BUTTON  = { id: 'edit-submitted-sba-quicksign-children-submit' }
  EMAIL  = { id: 'edit-submitted-mail' }
  FIRST_NAME = { id: 'edit-submitted-sbp-first-name' }
  LAST_NAME  = { id: 'edit-submitted-sbp-last-name' }
  SUBMIT_BUTTON   = { id: 'edit-submit'  }
  SUCCESS_MESSAGE = { css: '.webform-confirmation' }
  FAILURE_MESSAGE = { css: '.alert.error' }
  SIGNATURE = { id: 'edit-submitted-sbp-rps-optin-1' }

  def initialize(driver)
    super
    visit '/node/111'
    raise 'Form not ready' unless
      is_displayed?(PETITION_FORM)
    end

  def with(email, firstname, lastname, signature)
    type email, EMAIL
    type firstname, FIRST_NAME
    type lastname, LAST_NAME
    setrecurs signature, SIGNATURE

    @driver.find_element(SUBMIT_BUTTON).click
  end

  def quicksign(quicksignemail)
    type quicksignemail, QUICKSIGN_EMAIL

    @driver.find_element(QUICKSIGN_BUTTON).click
  end

  def success_message_present?
    wait_for(10) { is_displayed? SUCCESS_MESSAGE }
  end

  def failure_message_present?
    is_displayed? FAILURE_MESSAGE
  end

end
