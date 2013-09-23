require 'spec_helper'

describe "testimonials/show" do
  before(:each) do
    @testimonial = assign(:testimonial, stub_model(Testimonial,
      :vacation_consultant_id => 1,
      :content => "MyText",
      :customer_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
