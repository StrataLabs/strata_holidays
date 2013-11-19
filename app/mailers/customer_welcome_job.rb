class CustomerWelcomeJob < Struct.new(:customer)
  def perform
    CustomersMailer.welcome_aboard(customer).deliver
  end
end