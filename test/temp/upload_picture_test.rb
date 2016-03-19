# coding: utf-8
require 'test_helper'
require_relative '../../app/temp/upload_picture.rb'

class UploadTest < ActiveSupport::TestCase
  test "transform source path to target path" do
    source_path = "/temp/ruby/ruby_on_rails/Good.rb"
    target_dir = "/tmp"
    target_path = transform_source_target(source_path, target_dir)
    assert_equal target_path, "/tmp/Good.rb"
  end

  test "upload file successful" do
    source_path1 = "/temp/ruby.rb"
    source_path2 = File.expand_path('../../picture/Header.jpg', __FILE__)
    # 获取目标的文件目录
    upload_target_path = AvatarUploader.new.store_dir
    # 测试文件不存在的情况
    result = upload_file(source_path1)
    assert_not result

    # 测试文件存在的情况
    result = upload_file(source_path2)
    assert result

    # 测试文件是否上传成功
    target_path = transform_source_target(source_path2, upload_target_path)
    assert_equal File.exist?(target_path), true
    # 删除测试上传的文件
    if File.exist?(target_path)
      File.delete(target_path)
    end
  end

  test "global match and replace all markdown url which with picture extname" do
    markdown_content = %q(
    #Good
    [url] (/oh/my/gho/python.py)
    [url] (/hello/world/ruby.rb)
    [url] (/hello/world/ruby.jpg)
)
    upload_target_path = AvatarUploader.new.store_dir
    upload_prefix = File.basename upload_target_path
    mardown_result = %Q(
    #Good
    [url] (/oh/my/gho/python.py)
    [url] (/hello/world/ruby.rb)
    [url] (#{File.join(upload_prefix, "ruby.jpg")})
)
    result = match_markdown_image_url_then_replace(markdown_content)
    assert_equal result, mardown_result
  end

  test "fetch source path of picture" do
    markdown_content = %q(
    #Good
    [image] (/oh/my/gho/python.py)
    [image] (/hello/world/ruby.rb)
    [image] (/hello/world/ruby.jpg)
    [image] (/hello/world/python.png)
)
    result = fetch_all_source_path_of_picture(markdown_content).sort
    expect_result = ["/hello/world/python.png", "/hello/world/ruby.jpg"].sort
    assert expect_result == result
  end
end
