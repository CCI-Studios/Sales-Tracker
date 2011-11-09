Factory.define :user do |user|
  user.email                  "foo@bar.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :attempt do |attempt|
  attempt.value               1000
  attempt.association         :user
end