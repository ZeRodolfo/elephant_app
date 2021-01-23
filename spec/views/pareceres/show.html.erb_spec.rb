require 'rails_helper'

RSpec.describe "pareceres/show", type: :view do
  before(:each) do
    @parecer = assign(:parecer, Parecer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
