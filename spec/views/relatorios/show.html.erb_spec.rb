require 'rails_helper'

RSpec.describe "relatorios/show", type: :view do
  before(:each) do
    @relatorio = assign(:relatorio, Relatorio.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
