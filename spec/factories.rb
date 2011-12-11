
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
  campaign.title              { Factory.next(:title) }
end

Factory.define :company do |company|
  company.title               { Factory.next(:title) }
  company.first_name          "Foo"
  company.last_name           "Bar"
  company.phone               "(519) 555-1234"
  company.email               { Factory.next(:email) }
end

Factory.define :sale do |sale|
  sale.total                  1000
  sale.association            :campaign
  sale.association            :company
  sale.association            :user
end

Factory.define :user do |user|
  user.email                  { Factory.next(:email) }
  user.password               "foobar"
  user.password_confirmation  "foobar"
end