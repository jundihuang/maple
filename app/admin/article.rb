ActiveAdmin.register Article do
  menu parent: I18n.t("Blog"), label: I18n.t("Article")
  permit_params :title, :body, :subtitle, :classification_id, :tag_list

  filter :classification
  filter :base_tags

  index do
    column :title
    column :subtitle
    column :classification
    column :created_at
    column :updated_at
    column :tag_list
    actions
  end

  show :title => :title

  form do |f|
    f.inputs "Article details" do
      f.input :title
      f.input :subtitle
      f.input :body
      f.input :classification
      f.input :tag_list
    end
    f.actions
  end
end
