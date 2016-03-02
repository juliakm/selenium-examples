# filename: config_cloud.rb
ENV['base_url']          ||= 'http://jacksonriver:u0fe87d2622d2a4f@hub.crossbrowsertesting.com:80/wd/hub'
ENV['host'] = "crossbrowsertesting"
ENV['CBT_USERNAME']       = 'jacksonriver'
ENV['CBT_ACCESS_KEY']     = 'u0fe87d2622d2a4f'
ENV['name']               = "Julia Testing Selenium Locally"
ENV['build']              =  'jacksonriver'
ENV['browser_api_name']   = 'MblSafari8.0'
ENV['os_api_name']        = 'iPhone6Plus-iOS8sim'
ENV['screen_resolution']  = '1080x1920'
ENV["record_video"]       = "true"
ENV["record_network"]     = "true"

# Please visit here https://code.google.com/p/selenium/wiki/RubyBindings for detailed installation and instructions
