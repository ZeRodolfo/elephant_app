require 'rails_helper'

RSpec.describe "atestados/index", type: :view do
  before(:each) do
    assign(:atestados, [
      Atestado.create!(),
      Atestado.create!()
    ])
  end

  it "renders a list of atestados" do
    render
  end
end
