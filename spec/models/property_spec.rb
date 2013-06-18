require 'spec_helper'

describe Property do
  context "associations" do
    it { should belong_to :destination }
  end
end
