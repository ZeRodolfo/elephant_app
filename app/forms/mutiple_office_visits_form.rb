class MultipleOfficeVisitsForm
  include ActiveForm::Form
  include DateHelper

  properties :id_patient, :start_date, :end_date, :hour, :repetition

  validates :id_patient, :start_date, :hour, :repetition, presence: true

  validate :is_interval_valid

  validate :is_end_date_present

  validate :validity_of_dates

  def validity_of_dates
    errors.add(:start_date, "A data é inválida.") if DateHelper.parse(start_date).nil?

    return unless repetition.to_i > 0
    errors.add(:end_date, "A data é inválida.") if DateHelper.parse(end_date).nil?
  end

  def is_interval_valid
    return unless repetition.to_i > 0
    if start_date > end_date
      errors.add(:start_date, "O intervalo é inválido.")
      errors.add(:end_date, "O intervalo é inválido.")
    end
  end

  def is_end_date_present
    if repetition.to_i > 0 && end_date.empty?
      errors.add(:end_date, "Ao definir repetição é obrigatório definir o fim do intervalo.")
    end
  end
end
