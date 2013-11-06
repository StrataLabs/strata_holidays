class PromotionMailerJob < Struct.new(:params)
  def perform
    UnwindersMailer.promotion_mail(params).deliver
  end
end