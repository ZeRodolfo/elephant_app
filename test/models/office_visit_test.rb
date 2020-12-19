# == Schema Information
#
# Table name: office_visits
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :string
#  documents   :json
#  hour        :string
#  value       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_office_visits_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'test_helper'

class OfficeVisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
