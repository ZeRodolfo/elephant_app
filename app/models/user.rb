# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birth_date             :date
#  document_number        :string
#  document_type          :string           default("CPF")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mercado_pago_id        :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: false
  has_one :subscription

  enum document_type: { CPF: 'CPF', CNPJ: 'CNPJ' }

  with_options presence: true do
    validates :phone
    validates :first_name
    validates :last_name
    validates :document_number
    validates :birth_date
  end

  before_validation :clean_masked_fields
  validates_associated :addresses

  def name
    "#{first_name} #{last_name}"
  end

  def phone_ddd
    self.phone[0..1]
  end

  def phone_number
    self.phone[2..-1]
  end

  # Whether the user is registered on mercado pago
  def integrated?
    mercado_pago_id.present?
  end

  def has_active_subscription?
    subscription.present? && subscription.active?
  end

  private
    def clean_masked_fields
      self.document_number = self.document_number.to_s.gsub /[^\d]/, ''
      self.phone = self.phone.to_s.gsub /[^\d]/, ''
    end
end
