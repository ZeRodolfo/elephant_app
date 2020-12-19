# == Schema Information
#
# Table name: forms
#
#  id                            :bigint           not null, primary key
#  conclusions                   :string
#  dificulties                   :string           default([]), is an Array
#  facilities                    :string           default([]), is an Array
#  intelectual_map               :string           default([]), is an Array
#  interests                     :string
#  performance_diagnostic        :string
#  personal_moment               :string
#  personalities_characteristics :string           default([]), is an Array
#  profissional_moment           :string
#  psicological_concepts         :integer          default([]), is an Array
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  patient_id                    :bigint
#
# Indexes
#
#  index_forms_on_patient_id  (patient_id)
#
require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
