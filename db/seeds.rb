#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Products extension
Refinery::Products::Engine.load_seed

homePage = Refinery::Page.where(:slug == 'home')
if !homePage.blank?
	photo = Refinery::Image.new
	photo.image = File.open(File.join(Rails.root, "/app/assets/images/down.png"))
	photo.save!
	pagePart = Refinery::PagePart.find_by_id(1)
	pagePart.update_attribute(:body, "<div id=\"introduction1\"><span class=\"white\">企业应用软件</span><strong class=\"light-blue\">专家</strong></div><div id=\"introduction2\"><span class=\"sky-blue\">企业网站/购物商城/客户关系管理/GPS定位预警</span></div><hr /><div id=\"introduction3\"><span class=\"white-blue\">“塑梦科技”帮助中小型企业打造互联网企业商务平台，推进企业智能化、信息化建设，助力有梦想的合作伙伴挺进新一轮信息革命的</span><span class=\"white\">浪潮之巅</span></div><div id=\"introduction4\"><img src=\"#{photo.url}\" rel=\"225x255\" width=\"45\" height=\"44\" /></div>" )
end
