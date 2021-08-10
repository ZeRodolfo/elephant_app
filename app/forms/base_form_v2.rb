class BaseFormV2 < BaseForm
  attr_reader :fields, :version

  def initialize
    @fields = []
    @version = '2'
  end
end
