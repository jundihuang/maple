# coding: utf-8
require_relative "../temp/upload_picture.rb"

ActiveAdmin.register Article do
  before_save :setting_markdown
  menu parent: "Blog", label: "Article"
  permit_params :title, :body, :subtitle, :special_id, :classification_id, :tag_list
  index do
    column :title
    column :subtitle
    column :special
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
      f.input :special
      f.input :classification
      f.input :tag_list
    end
    f.actions
  end

  controller do
    def setting_markdown(article_instance)
      #TODO
      # 1. 获取所有的图片链接，把图片存储到服务端。
      # 2. 把文章中的本地url替换成服务端url.
      # 获取所有的上传地址
      article_content = article_instance.body
      source_paths = fetch_all_source_path_of_picture(article_content)

      # 上传图片到服务器端
      source_paths.map { |a| upload_file(a) }

      # 替换文档中的路径
      string_content = match_markdown_image_url_then_replace(article_content)
      article_instance.body = string_content
    end
  end
end
