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
class Form < ApplicationRecord
  # validates_presence_of :personal_moment, :profissional_moment,
  # :interests, :conclusions, :performance_diagnostic

  validates :personal_moment, :profissional_moment,
  :interests, :personalities_characteristics, :conclusions,
   :performance_diagnostic, :intelectual_map, :facilities,
   :dificulties, :psicological_concepts, presence: false
end
