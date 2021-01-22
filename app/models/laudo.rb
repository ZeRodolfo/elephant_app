# == Schema Information
#
# Table name: laudos
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  kind        :string           default(NULL)
#  procedure   :string
#  references  :string
#  solicitante :string
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
	enum kind: { psicologico: 'Psicológico', neuropsicologico: 'Neuropsicológico' }
	validates :analysis, :conclusion, :crp, :description, :procedure, :references, :solicitante, :kind, presence: true

	def self.kind_for_select
    self.kinds.to_a.map{ |x| [x[1], x[0]] }
	end

	def readable_kind
    self.class.kinds[self.kind]
  end

  def pdf
    document = LaudoPdf.new(self, patient)
    document.build
    document.pdf
  end
end
