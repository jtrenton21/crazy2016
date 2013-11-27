class StaticPagesController < ApplicationController
	



        def news
                url = 'http://blog.shopittome.com/'
                @data = Nokogiri::HTML(open(url))

                @image_link_inner = @data.at_css("img").attribute('src').to_s

                @img_srcs = @data.css('.format_text img').map{ |i| i['src'] }

                @img_title = @data.css('h2 a').map{ |i| i['title'] }

                @h2_count = @data.css('h2').count
                
                @image_link = @data.at_css("img")
                @temp = @image_link.attribute('src').to_s
                #ap image_link
        end
end


