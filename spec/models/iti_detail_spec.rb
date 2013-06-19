require 'spec_helper'

describe ItiDetail do
  context "associations" do
    it { should belong_to :destination }
    it { should belong_to :iti_header }
    it { should belong_to :property }
  end
end

