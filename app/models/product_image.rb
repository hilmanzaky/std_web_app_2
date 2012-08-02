class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :image

  belongs_to :product
  has_attached_file :image, :styles => { :large => "1000x1000>", :medium => "500x500>", :thumb => "260x260>", :minithumb => "160x160>" }
end