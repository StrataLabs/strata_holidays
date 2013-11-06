class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - #{message.cc}"
    message.to = "surabhi.rammohan@strata.co.in"
    message.cc = ""
  end
end
