FactoryGirl.define do
  factory :user do
    id '100'
    password '123456'
    email 'joe_bloggs@example.com'
    created_at {DateTime.now}
    updated_at {DateTime.now}
    provider 'facebook'
    uid '1234567'
    name 'Joe Bloggs'
    image 'http://graph.facebook.com/1234567/picture?type=square'
  end
end