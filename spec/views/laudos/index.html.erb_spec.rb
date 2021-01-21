require 'rails_helper'

RSpec.describe "laudos/index", type: :view do
  before(:each) do
    assign(:laudos, [
      Laudo.create!(),
      Laudo.create!()
    ])
  end

  it "renders a list of laudos" do
    render
  end
end
