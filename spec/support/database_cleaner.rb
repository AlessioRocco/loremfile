RSpec.configure do |config|
  # Clean/Reset Mongoid DB prior to running the tests
  config.before :each do
    Mongoid.purge!
  end
end
