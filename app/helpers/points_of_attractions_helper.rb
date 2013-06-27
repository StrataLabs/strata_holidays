module PointsOfAttractionsHelper
  def build_destination_options
    options = {}
    Destination.all.each {|dest| options = options.merge({dest.name => dest.id}) }
    options
  end

  def build_poa_type_options
    options = {}
    PoaType.all.each {|poa| options = options.merge({poa.description => poa.id}) }
    options
  end
end
