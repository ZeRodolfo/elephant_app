# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  age            :integer
#  avatar         :json
#  code           :integer
#  company        :string
#  marital_status :string
#  name           :string
#  office         :string
#  schooling      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  form_id        :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_patients_on_form_id  (form_id)
#  index_patients_on_user_id  (user_id)
#
require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
