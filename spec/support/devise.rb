def full_title(page_title)
	base_title = "WineCards"
	if page_title.empty?
		base_title
	else
		"#{base_title} - #{page_title}"
	end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Warden::Test::Helpers
  Warden.test_mode!
end