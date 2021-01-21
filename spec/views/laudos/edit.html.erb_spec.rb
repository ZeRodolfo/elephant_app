require 'rails_helper'

RSpec.describe "laudos/edit", type: :view do
  before(:each) do
    @laudo = assign(:laudo, Laudo.create!())
  end

  it "renders the edit laudo form" do
    render

    assert_select "form[action=?][method=?]", laudo_path(@laudo), "post" do
    end
  end
end
