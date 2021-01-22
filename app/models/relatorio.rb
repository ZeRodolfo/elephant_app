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
#  kind        :string           default(NULL)
#  procedure   :string
#  solicitante :string
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
  enum kind: { psicologico: 'Psicológico', multidisciplinar: 'Multidisciplinar' }
  validates :analysis, :atendido, :conclusion, :crp, :description, :goal, :procedure, :solicitante, :kind, presence: true

  def self.kind_for_select
    self.kinds.to_a.map{ |x| [x[1], x[0]] }
  end

  def readable_kind
    self.class.kinds[self.kind]
  end

  def pdf
    RelatorioPdf.new(self, patient).pdf
  end
end
