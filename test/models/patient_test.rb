# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  avatar         :json
#  birth_date     :date
#  code           :string
#  gender         :integer
#  name           :string
#  phone          :string
#  profession     :string
#  relative_phone :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
