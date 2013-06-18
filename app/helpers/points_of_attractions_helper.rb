module PointsOfAttractionsHelper
  def build_destination_options
    options = {'-- Please Select  --' => nil}
    Destination.all.each {|dest| options = options.merge({dest.name => dest.id}) }
    options
  end

  def build_poa_type_options
    options = {'-- Please Select  --' => nil}
    PoaType.all.each {|poa| options = options.merge({poa.poa_type => poa.id}) }
    options
  end
end
