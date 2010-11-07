module Magento
  class OrderItem < Base
    class << self      
      def find_by_id(id)
        Order.list.each do |order|
          Order.info(order.id).order_items.select{ |i| i.id == id }
        end
      end
      
      def find_by_order_and_id(order_id, id)
        Order.find_by_id(order_id).order_items.select{ |i| i.id == id }
      end
    end
    
    def id
      self.item_id
    end
    
    def order
      Order.info(self.order_id)
    end
    
    def product
      Product.find_by_id_or_sku(self.product_id)
    end
  end
end