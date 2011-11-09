
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :title do |n|
  "title-#{n}"
end

Factory.define :attempt do |attempt|
  attempt.value               1000
  attempt.association         :campaign
  attempt.association         :company
  attempt.association         :user
end

Factory.define :campaign do |campaign|
  campaign.sequence(:title)    { |n| "title-#{n}" }
end

Factory.define :company do |company|
  company.sequence(:title)    { |n| "title-#{n}" }
  company.first_name          "Foo"
  company.last_name           "Bar"
  company.phone               "(519) 555-1234"
  company.email               "foo@bar.com"
end

Factory.define :user do |user|
  user.email                  "foo@bar.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end