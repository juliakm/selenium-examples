# filename: spec/spec_helper.rb

require 'selenium-webdriver'

RSpec.configure do |config|

  config.before(:each) do |example|
    case ENV['host']
    when 'crossbrowsertesting'
      caps = Selenium::WebDriver::Remote::Capabilities.new
      caps["name"] = "Selenium Test Example"
      caps["build"] = "jacksonriver"
      caps["browser_api_name"] = "IE10"
      caps["os_api_name"] = "Win7x64-C2"
      caps["screen_resolution"] = "1024x768"
      caps["record_video"] = "false"
      caps["record_network"] = "false"

      @driver = Selenium::WebDriver.for(:remote,
      :url => "http://jacksonriver:u0fe87d2622d2a4f@hub.crossbrowsertesting.com:80/wd/hub",
      :desired_capabilities => caps)


  else
    case ENV['browser']
      when 'firefox'
        @driver = Selenium::WebDriver.for :firefox
      when 'chrome'
        Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd,'vendor/chromedriver')
        @driver = Selenium::WebDriver.for :chrome
      when 'safari'
        @driver = Selenium::WebDriver.for :safari
      end
  end
end

  config.after(:each) do
    @driver.quit
  end

end
