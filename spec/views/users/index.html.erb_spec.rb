require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email2",
        :password => "Test"
      ),
      User.create!(
        :email => "Email",
        :password => "Test"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 1
    # assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
