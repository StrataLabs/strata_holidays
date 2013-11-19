class UnwindersMailer < ActionMailer::Base
  default :template_path => 'mailers/unwinders'
  default :from => 'info@strataholidays.in'

  def promotion_mail(details)
    @content = details[:content]
    @include_image = false
    if details[:include_image]
      @include_image = true
      @url = Campaign.find(details[:id]).image.url(:landscape)
    end
    mail(:to => details[:to_ids], :cc => details[:cc_ids], :subject => details[:subject])
  end

  def vc_registration_confirmation(vc_registration)
    @vc_registration = vc_registration
    mail(:to => @vc_registration.email, :subject => "Unwinders - Thank you for your interest")
  end
end
