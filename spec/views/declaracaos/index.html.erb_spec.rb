require 'rails_helper'

RSpec.describe "declaracaos/index", type: :view do
  before(:each) do
    assign(:declaracaos, [
      Declaracao.create!(),
      Declaracao.create!()
    ])
  end

  it "renders a list of declaracaos" do
    render
  end
end
