# filename: base_form.rb
require 'selenium-webdriver'

class BaseForm

  def initialize(driver)
    @driver = driver
  end

  def visit(url)
    @driver.get url
  end

  def find(locator)
    @driver.find_element locator
  end

  def type(text, locator)
    find(locator).send_keys text
  end

  def wait_for (seconds = 15)
      Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def setrecurs (bool, locator)
    if bool == '1'
        find(locator).click
    end
  end

  #Try to get this working
  def dropdown(text, locator)
    dropdown_list = @driver.find_element(locator)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
    select_list.select_by(:text ,text)
  end

  def click(locator)
    find(locator).click
  end

  def is_displayed?(locator)
    find(locator).displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError
      false
  end

end
