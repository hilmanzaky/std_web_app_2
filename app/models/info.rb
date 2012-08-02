class Info < ActiveRecord::Base
  attr_accessible :content, :title, :header_link_id

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :header_link
end
