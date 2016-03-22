AdminUser.create!(email:"maple@admin.com",password:"mapleadmin")
Classification.create!(title: "技术")
Classification.create!(title: "人文")
Classification.create!(title: "趣事")
Special.create!(title:"ruby")
Special.create!(title:"rails")
Special.create!(title:"日記")
50.times do |n|
  Article.create!( title: "this is test article #{n}",
                   subtitle: "test article",
                   body: "this is test article #{n}, this is test article,this is test article,this is test article,",
                   classification_id: Classification.find_by(title:"技术").id,
                   special_id: Special.find_by(title:"rails").id
                  )
end

50.times do |n|
  Article.create!( title: "humans ,this is test article #{n}",
                   subtitle: "test article",
                   body: "this is test article #{n}, this is test article,this is test article,this is test article,",
                   classification_id: Classification.find_by(title:"人文").id,
                   special_id: Special.find_by(title:"日記").id
                  )
end