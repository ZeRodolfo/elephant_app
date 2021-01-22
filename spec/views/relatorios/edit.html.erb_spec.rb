require 'rails_helper'

RSpec.describe "relatorios/edit", type: :view do
  before(:each) do
    @relatorio = assign(:relatorio, Relatorio.create!())
  end

  it "renders the edit relatorio form" do
    render

    assert_select "form[action=?][method=?]", relatorio_path(@relatorio), "post" do
    end
  end
end
