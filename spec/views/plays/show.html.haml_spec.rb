require 'rails_helper'

RSpec.describe "plays/show", :type => :view do
  before(:each) do
    @play = assign(:play, Play.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
