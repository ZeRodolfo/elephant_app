require 'rails_helper'

RSpec.describe "pareceres/edit", type: :view do
  before(:each) do
    @parecer = assign(:parecer, Parecer.create!())
  end

  it "renders the edit parecer form" do
    render

    assert_select "form[action=?][method=?]", parecer_path(@parecer), "post" do
    end
  end
end
