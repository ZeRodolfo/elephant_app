require 'rails_helper'

RSpec.describe "relatorios/index", type: :view do
  before(:each) do
    assign(:relatorios, [
      Relatorio.create!(),
      Relatorio.create!()
    ])
  end

  it "renders a list of relatorios" do
    render
  end
end
