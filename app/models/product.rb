class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :category_id, :image
  belongs_to :category
  belongs_to :payment
  has_many :line_items

  has_attached_file :image, 
  					  :styles => { :export => {:geometry => "250x150#", :quality => 100, :format => 'JPG'} },
  					  :convert_options => { :all => "-quality 100" },
  					  :processor => "mini_magick",
  					  :url  => "/assets/images/contents/:basename.:extension",
  					  :path => ":rails_root/public/assets/images/contents/:basename.:extension"

  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] 
end
