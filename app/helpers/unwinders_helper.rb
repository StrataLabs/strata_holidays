module UnwindersHelper
  def generate_jit_tree
    destinations = []
    Destination.all.each do |d|
      poa_children = []
      d.points_of_attractions.each do |poa|
        point = {"id" => poa.id, "name"=>poa.name, "data"=>{"band"=>"Destination", "relation"=>"POA"}, "children"=>[]}
        poa_children << point
      end
      dest_json = {"id" => d.id, "name" => "Destination", "data" => {"band" => "Vacation Consultant", "relation" => "destination list"}, "children" => poa_children}
      destinations << dest_json
    end
    json = {
      "id"=> "1",
      "name" => "Strata Holidays",
      "children"=>destinations,
      "data"=>[]
    }
  end
end
