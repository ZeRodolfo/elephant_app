# == Schema Information
#
# Table name: office_visits
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :string
#  documents   :json
#  hour        :string
#  value       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_office_visits_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class OfficeVisit < ApplicationRecord
  include DateHelper
  belongs_to :patient
  has_many :parcels

  validates :hour, :date, presence: true

  mount_uploaders :documents, DocumentUploader

  validate :validity_of_date

  def validity_of_date
    errors.add(:date, "A data é inválida.") if DateHelper.parse(date).nil? 
  end

  def as_json(options = {})
    super(options).merge({
      'patient_name' => patient.name
    })
  end
end
