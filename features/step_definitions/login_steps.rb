
#Config Success case:
Before('@omniauth_test_success') do
    OmniAuth.config.test_mode = true
    Capybara.default_host = 'http://localhost:3000'
  
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider  => "facebook",
      :uid       => '1234567',
      :info      => {
        :email      => "testtest@email.com",
        :first_name => "John",
        :last_name  => "Doe",
        :name       => "John Doe"
      }
    })
end
  
#Config Failure case:
Before('@omniauth_test_failure') do
    OmniAuth.config.test_mode = true
        [:default, :facebook].each do |service|
        OmniAuth.config.mock_auth[service] = :invalid_credentials
    end
end

After('@omniauth_test_failure') do
    OmniAuth.config.test_mode = false
end