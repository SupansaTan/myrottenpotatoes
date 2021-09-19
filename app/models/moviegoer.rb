class Moviegoer < ApplicationRecord
  attr_accessor :uid, :provider, :name # see text for explanation
  has_many :reviews
  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end
