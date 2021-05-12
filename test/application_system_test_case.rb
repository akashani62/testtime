require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_firefox, screen_size: [1400, 1400]
  Capybara.default_max_wait_time = 8
  # driven_by :selenium, using: :headless_chrome , screen_size: [1400, 1400]
  # Capybara.register_driver :poltergeist do |app|
#       Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path)
#   end
end
