
#Config Success case:
Before('@omniauth_test_success') do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = { 
        :provider  => "facebook",
        :uid       => '1234567',
        :info      => {
            :email      => "testtest@email.com",
            :first_name => "John",
            :last_name  => "Doe",
            :name       => "John Doe"
            # any other attributes you want to stub out for testing
      }
    }
end

#Config Failure Case
Before('@omniauth_test_failure') do
    OmniAuth.config.test_mode = true
    [:default, :facebook].each do |service|
        OmniAuth.config.mock_auth[service] = :invalid_credentials
        # or whatever status code you want to stub
    end
end