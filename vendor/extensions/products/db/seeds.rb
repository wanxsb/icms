Refinery::I18n.frontend_locales.each do |lang|
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
  photo.image = File.open("#{Rails.root}/app/assets/images/demo/demo-shop.png")
  photo.save!
  
  Refinery::Products::Product.create!( 
    :title => "iStore",
    :price => 3600,
    :abstract => "abstract",
    :description  => "description",
    :detail => "detail",
    :photo_id => photo.id,
    :showOnIndex => true,
    :position => 1
    )
end
