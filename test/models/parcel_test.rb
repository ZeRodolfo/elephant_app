# == Schema Information
#
# Table name: parcels
#
#  id              :bigint           not null, primary key
#  observation     :string
#  value           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  office_visit_id :bigint
#
# Indexes
#
#  index_parcels_on_office_visit_id  (office_visit_id)
#
require 'test_helper'

class ParcelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
