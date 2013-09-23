require 'spec_helper'

describe "testimonials/index" do
  before(:each) do
    assign(:testimonials, [
      stub_model(Testimonial,
        :vacation_consultant_id => 1,
        :content => "MyText",
        :customer_id => 2
      ),
      stub_model(Testimonial,
        :vacation_consultant_id => 1,
        :content => "MyText",
        :customer_id => 2
      )
    ])
  end

  it "renders a list of testimonials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
