users = ['Alice', 'Bob', 'Carol', 'Dave', 'Erin', 'Frank'].map do |name|
  User.create!(name: name)
end

groups = ['Programming', 'Tennis', 'Cars', 'Weather', 'Food'].map do |name|
  Group.create!(name: name)
end

groups.each do |group|
  users.each do |user|
    group.users << user if [true, false].sample
  end
end
