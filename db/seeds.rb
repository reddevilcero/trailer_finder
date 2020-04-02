require 'faker'

Worker.all.destroy_all
Trailer.all.destroy_all
Depot.all.destroy_all
Shift.all.destroy_all


Worker.create(
  first_name: 'Westmater',
  last_name: '',
  email: 'web@master.com',
  license:'123456',
  password: '0000',
  is_admin?: true,
  rol: 'driver',
  seniority: '2015-1'
)
Worker.create(
  first_name: 'admin',
  last_name: 'test',
  email: 'admin@test.com',
  license:'',
  password: '0000',
  is_admin?: true,
  rol: 'admin',
  seniority: '2018-1'
)
Worker.create(
  first_name: 'driver',
  last_name: 'test',
  email: 'driver@test.com',
  license:'1234567890',
  password: '0000',
  seniority: '2015-12'
)
50.times do 
  Worker.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '0000',
    license: Faker::DrivingLicence.british_driving_licence,
    seniority: Faker::Date.between(from: 10.years.ago, to: Date.today),
    rol: 'driver',
    depot_id: rand(1..30)
  )
end
branch = ['CML', 'Culina', 'Morgan Mclernon', 'Great Bear', 'Warrens', 'IPS', 'Robson' ]
15.times do
  Depot.create(
    name: branch[rand(0...branch.size)],
    location: Faker::Address.city
  )
end
make = ["CARTWRIGHT", "KRONE", "MONTRACON", "SCHMITZ", "FRUEHAUF"]
500.times do
  Trailer.create(
    identifier: "#{(1..3).map{Array('A'..'Z')[rand(26)]}.join}#{rand(999)}",
    make: make[rand(0...make.size)],
    vor: Faker::Boolean.boolean(true_ratio: 0.1),
    mot_date: Faker::Date.forward(days: 300),
    depot_id: rand(1..30)
   
  )
end

5000.times do 
  Shift.create(
    worker_id: rand(1..500),
    start_depot: Depot.find_by_id(rand(1..30)),
    end_depot: Depot.find_by_id(rand(1..30)),
    trailer_id: rand(1..2000),
    comments: ''
  )
end
