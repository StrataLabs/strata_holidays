require 'spec_helper'

describe "testimonials/edit" do
  before(:each) do
    @testimonial = assign(:testimonial, stub_model(Testimonial,
      :vacation_consultant_id => 1,
      :content => "MyText",
      :customer_id => 1
    ))
  end

  it "renders the edit testimonial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", testimonial_path(@testimonial), "post" do
      assert_select "input#testimonial_vacation_consultant_id[name=?]", "testimonial[vacation_consultant_id]"
      assert_select "textarea#testimonial_content[name=?]", "testimonial[content]"
      assert_select "input#testimonial_customer_id[name=?]", "testimonial[customer_id]"
    end
  end
end
