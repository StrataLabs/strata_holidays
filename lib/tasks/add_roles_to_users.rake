desc "Add roles to existing users"
task :add_roles_to_users => :environment do
  users = User.all
  users.each do |user|
    user.add_role :default
    if user.user_type == User::CUSTOMER
      user.add_role :traveller
    elsif user.user_type == User::VC
      user.add_role :planner
    elsif user.user_type == User::ADMIN
      user.add_role :admin
    end
  end
end
