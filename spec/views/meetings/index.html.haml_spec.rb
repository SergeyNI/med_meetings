require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        user: nil,
        doctor: nil,
        suggestion: "Suggestion"
      ),
      Meeting.create!(
        user: nil,
        doctor: nil,
        suggestion: "Suggestion"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Suggestion".to_s, count: 2
  end
end
