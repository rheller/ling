require 'rails_helper'

RSpec.describe "plays/new", :type => :view do
  before(:each) do
    assign(:play, Play.new())
  end

  it "renders new play form" do
    render

    assert_select "form[action=?][method=?]", plays_path, "post" do
    end
  end
end
