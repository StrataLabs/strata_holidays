class VacationConsultantsMailer < ActionMailer::Base
  default :template_path => 'mailers/vacation_consultants'
  default :from => 'info@strataholidays.in'

  def new_request_notification(vc_assignment)
    @vc = vc_assignment.vacation_consultant
    @request = vc_assignment.cust_iti_request
    mail(:to => @vc.email, :subject => "Unwinders - You have a new holiday request!")
  end

  def customer_response_notification(header)
    @header = header
    mail(:to => @header.vacation_consultant.email, :subject => "Unwinders - Your itinerary for request ID #{@header.cust_iti_request_id} has been #{@header.state}")
  end

  def vc_registration_approval(vc_registration)
    @vc_reg = vc_registration
    mail(:to => @vc_reg.email, :subject => "Unwinders - Welcome aboard!")
  end
end