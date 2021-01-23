require 'rails_helper'

RSpec.describe "pareceres/index", type: :view do
  before(:each) do
    assign(:pareceres, [
      Parecer.create!(),
      Parecer.create!()
    ])
  end

  it "renders a list of pareceres" do
    render
  end
end
