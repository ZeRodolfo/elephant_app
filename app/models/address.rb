# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  cep          :string
#  city         :string
#  complement   :string
#  neighborhood :string
#  number       :integer
#  street       :string
#  uf           :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Address < ApplicationRecord
  belongs_to :user, optional: true

  # with_options presence: true do
  #   validates :cep
  #   validates :city
  #   validates :number
  #   validates :street
  #   validates :uf
  #   validates :neighborhood
  # end

  def resume
    "#{street}, #{number}, #{neighborhood}, #{city} - #{uf}"
  end

  def self.pre_filled
    Address.new(
      cep: "NA", number: 0, street: "NA", city: "", uf: "", complement: "NA", neighborhood: "NA"
    )
  end

  def fill_missing
    [:city, :street, :uf, :neighborhood].each do |attribute|
      unless self[attribute].present?
        self[attribute] = "Não definido"
      end
    end

    unless cep.present?
      self.cep = "00000-000"
    end

    unless number.present?
      self.number = 0
    end

    # self.attributes.each do |attr_name, attr_value|
    #   unless self[attr_name].present?
    #     self[attr_name] = "Não definido"
    #    
    #   end
    # end
    return self
  end
end
