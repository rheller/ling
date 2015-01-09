require 'rails_helper'

RSpec.describe "plays/edit", :type => :view do
  before(:each) do
    @play = assign(:play, Play.create!())
  end

  it "renders the edit play form" do
    render

    assert_select "form[action=?][method=?]", play_path(@play), "post" do
    end
  end
end
