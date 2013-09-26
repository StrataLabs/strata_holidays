class VcAccountDetailsNotificationJob < Struct.new(:book, :user, :isbn)
  def perform
    ShMailer.isbn_not_found(book, user, isbn).deliver
  end
end