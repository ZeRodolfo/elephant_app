# == Schema Information
#
# Table name: atestados
#
#  id             :bigint           not null, primary key
#  certificate_at :date
#  cidade         :string
#  crp            :string
#  text           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  patient_id     :bigint
#
# Indexes
#
#  index_atestados_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Atestado < ApplicationRecord
  belongs_to :patient

  validates :cidade, :crp, :text, :certificate_at, presence: true

  def pdf
    document = AtestadoPdf.new(self, patient)
    document.build
    document.pdf
  end
end
