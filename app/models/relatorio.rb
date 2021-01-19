# == Schema Information
#
# Table name: relatorios
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  atendido    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  goal        :string
#  procedure   :string
#  solicitante :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_relatorios_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Relatorio < ApplicationRecord
    belongs_to :patient
    enum types: { psicologico: 0, multidisciplinar: 1 }
    validates :analysis, :atendido, :conclusion, :crp, :description, :goal, :procedure, :solicitante, :type, presence: true
end
