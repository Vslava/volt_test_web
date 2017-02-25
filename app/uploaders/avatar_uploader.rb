class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::BombShelter

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [300, 300]

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def image_type_whitelist
    [:jpeg, :png]
  end

  def max_pixel_dimensions
    [1024, 1024]
  end
end
