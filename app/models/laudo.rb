# == Schema Information
#
# Table name: laudos
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  procedure   :string
#  references  :string
#  solicitante :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_laudos_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Laudo < ApplicationRecord
    belongs_to :patient
    enum types: { psicologico: 0, neuropsicologico: 1 }
    validates :analysis, :conclusion, :crp, :description, :procedure, :references, :solicitante, :type, presence: true
end
