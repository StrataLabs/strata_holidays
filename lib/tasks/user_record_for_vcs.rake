desc "Build User records for consultants"
task :build_user_record_for_consultants => :environment do
  vcs = VacationConsultant.all
  vcs.each do |c|
    if c.user.nil?
      p c.id
      c.user = User.build(c)
      begin
        c.user.save!
        c.save!
      rescue => ex
        Rails.logger.error ex.message
      end
    end
  end
end
