class VersionMapper < ActiveRecord::Base
  serialize :children
  require 'cust_iti_header_version'
  require 'cust_iti_detail_version'
  require 'iti_cust_dest_poa_detail_version'

  def self.capture_itinerary_versions(cust_iti_header)
    v = VersionMapper.new
    v.value = cust_iti_header.versions.last.id
    v.children = []
    v.modeltype = "CustItiHeader"
    v.model_id = cust_iti_header.id
    cust_iti_header.cust_iti_details.each do |detail|
      d = VersionMapper.new
      d.children = []
      d.value = detail.versions.last.id
      d.modeltype = "CustItiDetail"
      d.model_id = detail.id
      detail.iti_cust_dest_poa_details.each do |poa|
        p = VersionMapper.new
        p.value = poa.versions.last.id
        p.children = []
        p.modeltype = "ItiCustDestPoaDetail"
        p.model_id = poa.id
        p.save
        d.children << p.id.to_s
      end
      d.save
      v.children << d.id.to_s
    end
    v.save
  end
end
