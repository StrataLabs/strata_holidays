class UnwindersController < ApplicationController
  def index
    dest = DestItiDetail.group(:dest_iti_header_id)
                        .select(:id, :dest_iti_header_id, 'count(dest_iti_header_id) as count')
                        .collect{|result| {:dest_iti_header_id => result.dest_iti_header_id, :count => result.count}}
    p @dest_headers = dest.sort_by{|d| d[:count]}.reverse!.first(4)
  end
end
