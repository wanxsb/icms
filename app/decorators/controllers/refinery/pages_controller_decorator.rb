Refinery::PagesController.class_eval do
  
  before_filter :find_product_on_index, :only => [:home]
  protected 
    def find_product_on_index
      @products_on_index = Refinery::Products::Product.where( :showOnIndex => true)
    end
end