# filename: spec/spec_helper.rb
# Run in chrome browser='chrome' rspec -r ./config.rb
# Run in safari browser='safari' rspec -r ./config.rb
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

  #     @driver = Selenium::WebDriver.for(
  # :remote,
  # url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
  # desired_capabilities: caps)


#       caps["build"] = ENV["build"]
#       caps["browser_api_name"] = ENV["browser_api_name"]
#       caps["os_api_name"] = ENV["os_api_name"]
#       caps["screen_resolution"] = ENV["screen_resolution"]
#       caps["record_video"] = ENV["record_video"]
#       caps["record_network"] = ENV["record_network"]
#       caps["name"] = example.metadata[:full_description]
#       caps['max_duration'] = 1200
#
#       driver = Selenium::WebDriver.for(:remote,
# :url => "http://#{ENV["CBT_USERNAME"]}:#{ENV["CBT_ACCESS_KEY"]}@hub.crossbrowsertesting.com:80/wd/hub",
# :desired_capabilities => caps)
      # puts driver.title
      # driver.quit

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
