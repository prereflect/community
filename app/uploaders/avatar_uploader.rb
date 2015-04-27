# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  version :profile_avatar do
    process :resize_to_fit => [200, 200]
  end

  version :post_avatar do
    process :resize_to_fit => [100, 100]
  end

  version :nav_avatar do
    process :resize_to_fit => [25, 25]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
