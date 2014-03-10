class OrderCart < ActiveRecord::Base
  attr_accessible :purchased_at, :orders_attributes, :order_id, :order, :ticket
  has_many :orders
def total_price
    # convert to array so it doesn't try to do sum on database directly
    orders.to_a.sum(&:full_price)
  end
  
  def paypal_encrypted(return_url, notify_url)
    values = {
      :business => APP_CONFIG[:paypal_email],
      :cmd => '_order_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    orders.each_with_index do |item, index|
        values.merge!({
          "amount_#{index+1}" => item.amount,
          "item_name_#{index+1}" => item.ticket.event.name,
          "item_number_#{index+1}" => item.id,
          "quantity_#{index+1}" => item.quantity
        })
      
    end
    encrypt_for_paypal(values)
  end
  

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

  # openssl encryption.
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

end

