require 'rails_helper'

RSpec.describe "plays/index", :type => :view do
  before(:each) do
    assign(:plays, [
      Play.create!(),
      Play.create!()
    ])
  end

  it "renders a list of plays" do
    render
  end
end
