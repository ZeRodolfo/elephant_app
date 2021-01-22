# == Schema Information
#
# Table name: pareceres
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  references  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_pareceres_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Parecer < ApplicationRecord
    belongs_to :patient

    validates :analysis, :conclusion, :crp, :description, :references, presence: true
end
