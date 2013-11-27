class Article < ActiveRecord::Base
  attr_accessible :author, :link, :photo, :published, :title

  has_attached_file :photo, 
  					:styles => { :export => {:geometry => "250x150#", :quality => 100, :format => 'JPG'} },
  					:convert_options => { :all => "-quality 100" },
  					:processor => "mini_magick",
  					:url  => "/assets/images/contents/:basename.:extension",
  					:path => ":rails_root/public/assets/images/contents/:basename.:extension"


  
end
