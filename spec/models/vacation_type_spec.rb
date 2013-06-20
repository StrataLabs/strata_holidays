require 'spec_helper'

describe VacationType do
  context "validation" do
    context "presence" do
      subject { FactoryGirl.create(:vacation_type) }
      it { should validate_presence_of :vac_type  }
    end
  end
end
