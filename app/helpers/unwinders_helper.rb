module UnwindersHelper
  def generate_jit_tree
    destinations = []
    Destination.first(15).each do |d|
      poa_children = []
      d.points_of_attractions.each do |poa|
        point = {"id" => poa.id, "name"=>poa.name, "data"=>{"band"=> d.name, "relation"=>"POA"}, "children"=>[]}
        poa_children << point
      end
      dest_json = {"id" => d.id, "name" => d.name, "data" => {"band" => "Strata Holidays", "relation" => "destination list"}, "children" => poa_children}
      destinations << dest_json
    end
    json = {
      "id"=> "VC",
      "name" => "Strata Holidays",
      "children"=>destinations,
      "data"=>[]
    }
  end
end
