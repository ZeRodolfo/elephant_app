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
end
