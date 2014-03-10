class Payment < ActiveRecord::Base
 belongs_to :order_cart
  serialize :params
  after_create :mark_order_cart_as_purchased
  
  private
  
  def mark_order_cart_as_purchased
    if status == "Completed" && params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        params[:mc_gross] == cart.total_price.to_s && params[:mc_currency] == "USD"
      order_cart.update_attribute(:purchased_at, Time.now)
    end
  end
end
  
end
