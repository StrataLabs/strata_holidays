require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :lphone => "MyString",
      :mphone => "MyString",
      :email => "MyString",
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_name[name=?]", "customer[name]"
      assert_select "input#customer_address_1[name=?]", "customer[address_1]"
      assert_select "input#customer_address_2[name=?]", "customer[address_2]"
      assert_select "input#customer_city[name=?]", "customer[city]"
      assert_select "input#customer_state[name=?]", "customer[state]"
      assert_select "input#customer_country[name=?]", "customer[country]"
      assert_select "input#customer_lphone[name=?]", "customer[lphone]"
      assert_select "input#customer_mphone[name=?]", "customer[mphone]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_comments[name=?]", "customer[comments]"
    end
  end
end
