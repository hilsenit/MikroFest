# Shorter syntax for for example '.build', so you don't have to write FactoryGirl every time
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
