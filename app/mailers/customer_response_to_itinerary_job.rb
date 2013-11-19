class CustomerResponseToItineraryJob < Struct.new(:header)
  def perform
    VacationConsultantsMailer.customer_response_notification(header).deliver
  end
end