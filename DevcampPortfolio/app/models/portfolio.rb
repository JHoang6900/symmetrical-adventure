class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumbs_image
end
