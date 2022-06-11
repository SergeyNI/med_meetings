require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, Meeting.new(
      user: nil,
      doctor: nil,
      suggestion: "MyString"
    ))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do

      assert_select "input[name=?]", "meeting[user_id]"

      assert_select "input[name=?]", "meeting[doctor_id]"

      assert_select "input[name=?]", "meeting[suggestion]"
    end
  end
end
