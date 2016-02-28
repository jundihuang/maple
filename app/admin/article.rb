ActiveAdmin.register Article do
  menu parent: "Blog", label: "Article"
  permit_params :title, :body, :subtitle, :special_id, :classification_id
  
  index do 
    column :title
    column :subtitle
    column :special
    column :classification
    column :created_at
    column :updated_at
    actions
  end
  
  show :title => :title
  
  form do |f|
    f.inputs "Article details" do
      f.input :title
      f.input :subtitle
      f.input :body
      f.input :special
      f.input :classification
    end
    f.actions
  end
end
