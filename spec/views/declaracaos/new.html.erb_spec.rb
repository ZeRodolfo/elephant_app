require 'rails_helper'

RSpec.describe "declaracaos/new", type: :view do
  before(:each) do
    assign(:declaracao, Declaracao.new())
  end

  it "renders new declaracao form" do
    render

    assert_select "form[action=?][method=?]", declaracaos_path, "post" do
    end
  end
end
