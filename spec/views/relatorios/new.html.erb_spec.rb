require 'rails_helper'

RSpec.describe "relatorios/new", type: :view do
  before(:each) do
    assign(:relatorio, Relatorio.new())
  end

  it "renders new relatorio form" do
    render

    assert_select "form[action=?][method=?]", relatorios_path, "post" do
    end
  end
end
