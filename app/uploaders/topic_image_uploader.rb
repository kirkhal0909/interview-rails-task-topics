class TopicImageUploader < CarrierWave::Uploader::Base
  storage :file

  #TODO demo show on Heroku
  def default_url(*args)
    "seeds/img#{model.id % 7 + 1}.jpg"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
