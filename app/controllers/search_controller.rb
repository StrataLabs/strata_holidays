class SearchController < ApplicationController
  require 'will_paginate/array'
  def custom_search
    search = Sunspot.search(Destination, PointsOfAttraction, VacationConsultant) do
      fulltext params[:search]
      facet(:class_name)
      paginate :page => params[:page] || 1, :per_page => 10
    end
    @search_results = search.results
    @count ={}
    search.facet(:class_name).rows.each do |r|
      @count[r.value] = r.count
    end
    render :layout => 'unwinders'
  end

end
