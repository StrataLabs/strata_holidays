require 'spec_helper'

describe VersionMapper do
  before(:each) do
    @cust_iti_request = FactoryGirl.create(:cust_iti_request)
    @vc_assignment1 = FactoryGirl.create(:vc_assignment, :cust_iti_request_id => @cust_iti_request.id, :state => "InProcess")

    @cust_iti_header1 = FactoryGirl.create(:cust_iti_header, :cust_iti_request_id => @cust_iti_request.id)
    @cust_iti_detail = FactoryGirl.create(:cust_iti_detail, :cust_iti_header_id => @cust_iti_header1.id)
    @iti_cust_dest_poa_detail = FactoryGirl.create(:iti_cust_dest_poa_detail, :cust_iti_detail_id => @cust_iti_detail.id)

    @cust_iti_header1.save
    @cust_iti_detail.save
  end

  it "constructs the tree capturing the current versions of all entities in the header" do
    VersionMapper.capture_itinerary_versions(@cust_iti_header1)
    VersionMapper.all.count.should == 3

    header_map = VersionMapper.where(:modeltype => "CustItiHeader", :model_id => @cust_iti_header1.id).first
    detail_map = VersionMapper.where(:modeltype => "CustItiDetail", :model_id => @cust_iti_detail.id).first
    poa_map = VersionMapper.where(:modeltype => "ItiCustDestPoaDetail", :model_id => @iti_cust_dest_poa_detail.id).first

    header_map.children.first.to_i.should == detail_map.id
    detail_map.children.first.to_i.should == poa_map.id
    poa_map.children.should == []

    header_map.value.should == @cust_iti_header1.versions.last.id
    detail_map.value.should == @cust_iti_detail.versions.last.id
    poa_map.value.should == @iti_cust_dest_poa_detail.versions.last.id
  end
end
