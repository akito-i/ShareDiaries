50.times do |n|
  User.create!(
    name:"test_user#{n + 1}",
    email:"test#{n + 1}@test.com",
    hobby:"test#{n + 1}",
    password:11111111
  )
end

