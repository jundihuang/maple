# coding: utf-8
require_relative '../uploaders/avatar_uploader.rb'
IMAGE_REGEX = /[ ]*\[([^\]]+)\][ ]*\(([^)]+)\)/
IMAGE_URL_REGEX = /\(([^)]+)\)/
IMAGE_EXT = [".png", ".jpg", ".jpeg", ".bmp", ".gif"]

def transform_source_target(source_path, target_dir)
  source_dir = File.dirname source_path
  source_filename = File.basename source_path
  File.join(target_dir, source_filename)
end

def upload_file(source_path)
  if File.exist? source_path
    uploader = AvatarUploader.new
    file_object = File.open(source_path)
    uploader.store!(file_object)
    true
  else
    false
  end
end


# 对markdown 文档的image的标签的图片地址进行替换，替换成上传后的地址。
def match_markdown_image_url_then_replace(markdown_string)
  target_full_dir = AvatarUploader.new.store_dir
  target_dir = File.basename target_full_dir
  markdown_string.gsub(IMAGE_REGEX) do |image|
    if image =~ IMAGE_URL_REGEX
      source_path = "#{$1}"
      if IMAGE_EXT.include? File.extname(source_path)
        file_name = File.basename source_path
        target_path = File.join(target_dir, file_name)
        image.sub(source_path, target_path)
      else
        image.sub(source_path, source_path)
      end
    end
  end
end


def fetch_all_source_path_of_picture(markdown_string)
  source_paths = Array.new
  markdown_string.gsub(IMAGE_REGEX) do |image|
    if image =~ IMAGE_URL_REGEX
      source_path = "#{$1}"
      if IMAGE_EXT.include? File.extname(source_path)
        source_paths << source_path
      end
    end
  end
  source_paths
end
