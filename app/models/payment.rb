class Payment < ActiveRecord::Base
  attr_accessible :amount, :indentifier, :payer_id, :token, :products_attributes
  has_many :products

  validates :amount, presence: true
  # validates :identifier, uniqueness: true
  

  def details
    
      client.details(self.token)
    end
  

  attr_reader :redirect_uri
  
  def setup!(return_url, cancel_url)
    response = client.setup(
      payment_request,
      return_url,
      cancel_url,
      pay_on_paypal: true,
      
    )
    self.token = response.token
    self.save!
    @redirect_uri = response.redirect_uri
    
    self
  end

 
  private

  def client
    Paypal::Express::Request.new PAYPAL_CONFIG
  end

  DESCRIPTION = {
    item: 'Donations',
    
  }

  

  
end
