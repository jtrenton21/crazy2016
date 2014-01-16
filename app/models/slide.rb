class Slide < ActiveRecord::Base
  attr_accessible :image, :title

   has_attached_file :image, 
  					 :styles => { :export => {:geometry => "250x150#", :quality => 100, :format => 'JPG'} },
  					 :convert_options => { :all => "-quality 100" },
  					 :processor => "mini_magick",
  					 :url  => "/assets/images/contents/:basename.:extension",
  					 :path => ":rails_root/public/assets/images/contents/:basename.:extension"
end
