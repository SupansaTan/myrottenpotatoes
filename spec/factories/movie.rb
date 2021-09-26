FactoryGirl.define do
  factory :movie do
    id '1'
    title 'A Fake Title' # default values
    rating 'PG'
    release_date { 10.years.ago }
  end
end