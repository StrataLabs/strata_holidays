module ItiCustDestPoaDetailsHelper
  def build_dest_iti_options(poa_all, poa)

    options = {}
    poa.dest_iti_details.each do |dest| 
      options = options.merge({"#{dest.dest_iti_header.dest_iti_name} - #{dest.dest_iti_header.destination.name}" => dest.id})
    end
    options
  end

  def build_dest_iti_options(dest)
    options = {}
    # dest = Destination.find(dest)
    dest_iti_headers = dest.dest_iti_headers

    dest_iti_headers.each do |dest_hdr|
      options = options.merge({"#{dest_hdr.dest_iti_name} - #{dest_hdr.destination.name}" => dest_hdr.id})
    end
    # poa.dest_iti_details.each do |dest| 
    #   options = options.merge({"#{dest.dest_iti_header.dest_iti_name} - #{dest.dest_iti_header.destination.name}" => dest.id})
    # end
    options
  end

  def build_poa_options(poa_all)
    options = {}
    poa_all.each do |poa|
      options = options.merge({"#{poa.name}" => poa.id})
    end    
    options
  end
end
