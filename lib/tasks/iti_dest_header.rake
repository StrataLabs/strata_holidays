desc "Rename ItiDestHeaders"
task :rename_iti_dest_header => :environment do
  itis = DestItiHeader.all
  itis.each do |iti|
    case iti.dest_iti_name
    when "First day"
      iti.dest_iti_name = "Category A"
    when "Second Day"
      iti.dest_iti_name = "Category B"
    when "Third day"
      iti.dest_iti_name = "Category C"
    when "Fourth day"
      iti.dest_iti_name = "Category D"
    when "Fifth day"
      iti.dest_iti_name = "Category E"
    when "Sixth day"
      iti.dest_iti_name = "Category F"
    end
    p iti.save(:validate => false)
  end
end
