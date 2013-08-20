#encoding: utf-8
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-products').blank?
        user.plugins.create(:name => 'refinerycms-products',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/products"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Products',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
  
  photo = Refinery::Image.new
  photo.image = File.open("#{Rails.root}/app/assets/images/demo/demo-shop-small.png")
  photo.save!
  
  
  product= Refinery::Products::Product.create!( 
    :name => "iStore网上商城",
    :price => 3600,
    :abstract => "灵活的促销方式，让您随意的改变促销规则；完善的购物车,强大的会员中心系统；支持支付宝,财付通等网上支付通道；",
    :description  => "<img src=#{photo.url}/>",
    :detail => "是一套面向中小传统企业推出的零售直销型全网营销快速解决方案，帮企业花少量投资，快速拥有属于自己的全网营销型官网商城，助力企业实现多渠道同步营销，跨平台同步管理，让企业快速、高效开启电子商务之路。电商云 <ul> <li>企业级| 稳定卓越官网</li><li>商城+淘宝+移动互联</li><li>多元化营销 | 辐射全网</li><li>多平台统一管理 | 高效运营</li></ul>",
    :showOnIndex => true,
    :position => 2
    )
    
  imagePage= Refinery::ImagePage.new
  imagePage.image = photo
  imagePage.page = product
  imagePage.save!
  
end
