module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      attr_accessible :name, :price, :abstract, :description, :detail, :showOnIndex, :position

      acts_as_indexed :fields => [:name, :abstract, :description, :detail]

      validates :name, :presence => true, :uniqueness => true
      has_many_page_images
    end
  end
end
