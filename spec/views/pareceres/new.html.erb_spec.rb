require 'rails_helper'

RSpec.describe "pareceres/new", type: :view do
  before(:each) do
    assign(:parecer, Parecer.new())
  end

  it "renders new parecer form" do
    render

    assert_select "form[action=?][method=?]", pareceres_path, "post" do
    end
  end
end
