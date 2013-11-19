class VcRegistrationApprovalNotificationJob < Struct.new(:vc_registration)
  def perform
    UnwindersMailer.vc_registration_confirmation(vc_registration).deliver
  end
end