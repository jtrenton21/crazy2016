class Ticket < ActiveRecord::Base
  belongs_to :event
  has_many :orders
  attr_accessible :date, :description, :event, :price, :time, :event_id, :orders_attributes

  def paypal_url(return_url, notify_url)
    values = {
      :business => AppConfig.paypal_email,
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :notify_url => notify_url,
      :cert_id => AppConfig.cert_id,
      :invoice => rand(10000)
    }
    values.merge!({
      "amount_1" => price,
      "item_name_1" => event,
      "item_number_1" => id,
      "quantity_1" => '1'
    })
    encrypt_for_paypal(values)
  end

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/#{Rails.env}/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/#{Rails.env}/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/#{Rails.env}/app_key.pem")

  # openssl encryption.
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end
end
