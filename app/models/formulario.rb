# == Schema Information
#
# Table name: formularios
#
#  id         :bigint           not null, primary key
#  content    :json
#  identifier :integer
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :bigint
#
# Indexes
#
#  index_formularios_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Formulario < ApplicationRecord
  INFANTIL = 0
  ADULTO = 1

  belongs_to :patient

  validates :content, :kind, :patient_id, :identifier, presence: true

  def pdf
    if identifier == INFANTIL
      form = AnamneseInfantilForm.new
      document = AnamneseInfantilPdf.new(form, patient)
    elsif identifier == ADULTO
      form = AnamneseAdultoForm.new
      document = AnamneseAdultoPdf.new(form, patient)
    end

    form.deserialize content
    document.build
    document.pdf
  end
end
