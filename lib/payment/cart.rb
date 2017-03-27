module Payment
  class Cart
    attr_reader :products, :promotions

    def initialize
      @products = []
      @promotions = []
    end

    def add(product)
      @products << product
    end

    def remove(product)
      position = @products.index(product)
      @products.delete_at(position) if position
    end

    def add_promotion(promotion)
      @promotions << promotion
    end

    def remove_promotion(promotion)
      position = @promotions.index(promotion)
      @promotions.delete_at(position) if position
    end

    def total_gross
      @products.inject(0) { |acc, elem| acc + elem.price }
    end

    def total_net
      net = total_gross
      apply_discount(net + apply_promotions)
    end

    # Returns an hash with product codes and product counts: {"001"=>2, "003"=>3}
    # checks if a promotion exists for product in the card and calculates total discount from
    # promotions by checking how many times the item exist in the card
    def apply_promotions
      product_counts = @products.each_with_object(Hash.new(0)) { |p, count| count[p.code] += 1 }
                                .keep_if { |_k, v| v >= 2 }
      total_amount = 0
      @promotions.each do |promotion|
        if product_counts.key?(promotion.code)
          total_amount -= promotion.amount * product_counts[promotion.code]
        end
      end
      total_amount
    end

    # make a 10% discount after 60 pounds
    def apply_discount(gross, limit = 60, rate = 10)
      if gross > limit
        (gross - (gross * rate / 100)).round(2)
      else
        gross
      end
    end
  end
end
