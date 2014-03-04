class Partner < ActiveRecord::Base
    attr_accessible :address, :city, :name, :phone, :photo, :state, :zip

	has_attached_file :photo, 
  					  :styles => { :export => {:geometry => "250x150#", :quality => 100, :format => 'JPG'} },
  					  :convert_options => { :all => "-quality 100" },
  					  :processor => "mini_magick",
  					  :url  => "/assets/images/contents/:basename.:extension",
  					  :path => ":rails_root/public/assets/images/contents/:basename.:extension"

  	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] 
end
