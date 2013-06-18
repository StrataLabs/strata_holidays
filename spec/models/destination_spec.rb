require 'spec_helper'

describe Destination do
  context "associations" do
    it { should have_many :points_of_attractions }
  end
end