require 'rails_helper'

RSpec.describe "declaracaos/show", type: :view do
  before(:each) do
    @declaracao = assign(:declaracao, Declaracao.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
