Worker.destroy_all
10.times do |i|
  Driver.create(first_name:"Dave#{i+50}",license:'1234',email:"123#{i}@123.com", password:'0000')
  Admin.create(first_name:"Morgan#{i+25}",is_admin?:true,email:"123#{i+100}@123.com", password:'0000')
end