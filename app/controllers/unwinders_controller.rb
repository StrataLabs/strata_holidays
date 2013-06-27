class UnwindersController < ApplicationController
  def index
    @body_id = "list"
    dest = DestItiDetail.group(:dest_iti_header_id)
                        .select(:dest_iti_header_id, 'count(dest_iti_header_id) as count')
                        .collect{|result| {:dest_iti_header_id => result.dest_iti_header_id, :count => result.count}}
    @dest_headers = dest.sort_by{|d| d[:count]}.reverse!.first(4)
  end

  def child
    @body_id = "transaction"
  end

  def home
    @body_id = "home"
  end
end
