require 'rails_helper'

RSpec.describe "atestados/new", type: :view do
  before(:each) do
    assign(:atestado, Atestado.new())
  end

  it "renders new atestado form" do
    render

    assert_select "form[action=?][method=?]", atestados_path, "post" do
    end
  end
end
