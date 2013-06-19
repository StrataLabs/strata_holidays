require 'spec_helper'

describe ItiDayDetail do
  context "associations" do
    it { should belong_to :iti_header }
    it { should belong_to :points_of_attraction }
  end
end
