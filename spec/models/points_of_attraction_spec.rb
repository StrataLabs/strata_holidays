require 'spec_helper'

describe PointsOfAttraction do
  context "associations" do
    it { should belong_to :destination }
  end
end

