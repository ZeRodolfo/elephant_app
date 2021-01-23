require 'rails_helper'

RSpec.describe "laudos/new", type: :view do
  before(:each) do
    assign(:laudo, Laudo.new())
  end

  it "renders new laudo form" do
    render

    assert_select "form[action=?][method=?]", laudos_path, "post" do
    end
  end
end
