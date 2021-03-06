require 'factory_girl'
require 'ffaker'

FactoryGirl.define do
  factory :publisher, class: Citygram::Models::Publisher do
    title { Faker::Lorem.words(3).join(' ') }
    endpoint { Faker::Internet.uri('https') }
    sequence(:city) { |n| "City-#{n}" }
    icon 'balloons.png'
    active true
  end

  factory :event, class: Citygram::Models::Event do
    publisher
    title { Faker::Lorem.words(3) }
    description { Faker::Lorem.paragraph(2) }
    feature_id { SecureRandom.hex(10) }
    geom do
      JSON.generate({
        "type"=>"Point",
        "coordinates"=>[Faker::Geolocation.lat,Faker::Geolocation.lng]
      })
    end
  end

  factory :subscription, class: Citygram::Models::Subscription do
    publisher
    webhook_url { Faker::Internet.uri('https') }
    channel 'webhook'
    geom do
      JSON.generate({
        "type"=>"Polygon",
        "coordinates"=>[[[100.0, 0.0],[101.0, 0.0],[101.0, 1.0],[100.0,1.0],[100.0,0.0]]]
      })
    end
  end
end
