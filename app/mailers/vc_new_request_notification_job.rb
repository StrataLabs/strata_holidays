class VcNewRequestNotificationJob < Struct.new(:vc_assignment_id)
  def perform
    vc_assignment = VcAssignment.find(vc_assignment_id)
    VacationConsultantsMailer.new_request_notification(vc_assignment).deliver
  end
end