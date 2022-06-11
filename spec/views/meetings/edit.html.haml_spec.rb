require 'rails_helper'

RSpec.describe "meetings/edit", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      user: nil,
      doctor: nil,
      suggestion: "MyString"
    ))
  end

  it "renders the edit meeting form" do
    render

    assert_select "form[action=?][method=?]", meeting_path(@meeting), "post" do

      assert_select "input[name=?]", "meeting[user_id]"

      assert_select "input[name=?]", "meeting[doctor_id]"

      assert_select "input[name=?]", "meeting[suggestion]"
    end
  end
end
