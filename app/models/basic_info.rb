class BasicInfo < ApplicationRecord
  mount_uploader :header_logo, ImageUploader
  mount_uploader :footer_logo, ImageUploader
end
