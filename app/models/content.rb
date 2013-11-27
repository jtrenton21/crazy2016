class Content < ActiveRecord::Base
  attr_accessible :author, :info, :photo, :source, :title, :visit_id
  belongs_to :visit 
  has_attached_file :photo, 
  					:styles => { :export => {:geometry => "250x150#", :quality => 100, :format => 'JPG'} },
  					:convert_options => { :all => "-quality 100" },
  					:processor => "mini_magick",
  					:url  => "/assets/images/contents/:basename.:extension",
  					:path => ":rails_root/public/assets/images/contents/:basename.:extension"

  # has_moderated_create :with_associations => :all
  
end
