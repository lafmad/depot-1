class Product < ActiveRecord::Base
  MIN_PRICE = 0.01
  validates :title, :description, :image_url, presence: true
  validates :title, length: {minimum: 10}
  validates :price, numericality: {greater_than_or_equals_to: 0.01, message: "The price is below #{MIN_PRICE}"}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)}, 
  	message: 'must be a URL for GIF, JPG or PNG image.'}
end