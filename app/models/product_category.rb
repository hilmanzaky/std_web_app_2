class ProductCategory < ActiveRecord::Base
  attr_accessible :name, :parent_id

  has_ancestry

  has_many :products, :dependent => :destroy
end
