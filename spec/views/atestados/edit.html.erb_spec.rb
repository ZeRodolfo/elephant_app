require 'rails_helper'

RSpec.describe "atestados/edit", type: :view do
  before(:each) do
    @atestado = assign(:atestado, Atestado.create!())
  end

  it "renders the edit atestado form" do
    render

    assert_select "form[action=?][method=?]", atestado_path(@atestado), "post" do
    end
  end
end
