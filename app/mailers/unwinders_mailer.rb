class UnwindersMailer < ActionMailer::Base
  default :template_path => 'mailers'
  default :from => 'info@strataholidays.in'

  def test_email
    mail(:to => "vishnu.prasad@strata.co.in", :subject => "Your Book recommendation is Sucessful and Order is Placed.")
  end

  def promotion_mail(details)
    @content = details[:content]
    @include_image = false
    if details[:include_image]
      @include_image = true
      @url = Campaign.find(details[:id]).image.url(:landscape)
    end
    mail(:to => details[:to_ids], :cc => details[:cc_ids], :subject => details[:subject])
  end
end
