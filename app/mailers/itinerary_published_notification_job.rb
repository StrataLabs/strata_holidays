class ItineraryPublishedNotificationJob < Struct.new(:header)
  def perform
    CustomersMailer.itinerary_published(header).deliver
  end
end