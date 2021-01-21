require 'rails_helper'

RSpec.describe "declaracaos/edit", type: :view do
  before(:each) do
    @declaracao = assign(:declaracao, Declaracao.create!())
  end

  it "renders the edit declaracao form" do
    render

    assert_select "form[action=?][method=?]", declaracao_path(@declaracao), "post" do
    end
  end
end
