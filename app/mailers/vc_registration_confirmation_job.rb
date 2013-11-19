class VcRegistrationConfirmationJob < Struct.new(:vc_registration)
  def perform
    VacationConsultantsMailer.vc_registration_approval(vc_registration).deliver
  end
end