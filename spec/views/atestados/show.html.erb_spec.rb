require 'rails_helper'

RSpec.describe "atestados/show", type: :view do
  before(:each) do
    @atestado = assign(:atestado, Atestado.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
