desc "Build User records for customers"
task :build_user_record_for_customers => :environment do
  customers = Customer.all
  customers.each do |c|
    if c.user.nil?
      u = User.where(:email => c.email).first
      if u.nil?
        c.user = User.build_user_for_customer(c)
      else
        c.user = u
      end
      begin
        c.user.save!
        c.save!
      rescue => ex
        Rails.logger.error ex.message
      end
    end
  end
end
