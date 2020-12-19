# == Schema Information
#
# Table name: configs
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Config < ApplicationRecord
  validates :name, uniqueness: true

  def self.get(name)
    Config.find_by_name(name)
  end

  def self.default_plan_id
    self.get('default_plan_id')
  end
end
