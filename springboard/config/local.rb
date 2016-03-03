# Run everything with rspec -r ./config.rb
# Alternate url base_url=http://localhost:4567 rspec -r ./config.rb
# filename: config.rb
ENV['base_url'] ||= 'https://492.qa.jacksonriverdev.com'
#ENV['base_url'] ||= 'https://876.joshestep.com'
ENV['browser'] ||= 'firefox'
