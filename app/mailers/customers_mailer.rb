class CustomersMailer < ActionMailer::Base
  default :template_path => 'mailers/customers'
  default :from => 'info@strataholidays.in'

  def new_request_confirmation(vc_ids, request_id)
    @vc_ids = vc_ids
    @request = CustItiRequest.find(request_id)
    mail(:to => @request.customer.email, :subject => "Unwinders - We have received your request!")
  end

  def itinerary_published(header)
    @cust_iti_header = header
    mail(:to => @cust_iti_header.cust_iti_request.customer.email, :subject => "Unwinders - Please review your itinerary")
  end

  def welcome_aboard(customer)
    @customer = customer
    mail(:to => @customer.email, :subject => "Unwinders - Welcome aboard!")
  end
end