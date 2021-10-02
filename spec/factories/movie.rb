FactoryGirl.define do
  factory :movie do
    id '1000'
    title 'A Fake Title' # default values
    rating 'PG'
    release_date { 10.years.ago }
  end
end