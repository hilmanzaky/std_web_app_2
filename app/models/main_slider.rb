class MainSlider < ActiveRecord::Base
  attr_accessible :description, :image
  has_attached_file :image, :styles => { :large => "1170x500>", :medium => "300x300>", :thumb => "100x100>" }
end
