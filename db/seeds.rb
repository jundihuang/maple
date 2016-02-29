AdminUser.create!(email:"maple@admin.com",password:"mapleadmin")
Classification.create!(title: "技术")
Classification.create!(title: "人文")
Classification.create!(title: "趣事")

50.times do |n|
  Article.create!( title: "this is test article #{n}",
                   subtitle: "test article",
                   body: "this is test article #{n}, this is test article,this is test article,this is test article,",
                   classification_id: Classification.find_by(title:"技术").id
                  )
end

50.times do |n|
  Article.create!( title: "humans ,this is test article #{n}",
                   subtitle: "test article",
                   body: "this is test article #{n}, this is test article,this is test article,this is test article,",
                   classification_id: Classification.find_by(title:"人文").id
                  )
end