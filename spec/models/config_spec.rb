# == Schema Information
#
# Table name: configs
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Config, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
