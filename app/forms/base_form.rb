class BaseForm
  attr_reader :fields

  def initialize
    @fields = []
  end

  def fill(data)
    data.each do |d|
      if d[0].present?
        field = @fields.detect { |f| f[:name] == d[0] }
        unless field.nil?
          field[:value] = (field[:type] == "text" || field[:type] == "textarea") ? d[1].chomp : d[1]
        end
      end
    end
  end

  def serialize
    @fields.each_with_object({}) { |f, hash| hash[f[:name]] = f[:value] }.to_json
  end

  def deserialize(data_json)
    data = JSON.parse(data_json)
    self.fill(data.to_a)
  end

  def clear
    @fields.each { |f| f.except!(:value) }
  end

  def each_field(*field_names, &block)
    field_names.each do |field_name|
      block.call self[field_name]
    end
  end

  def row_of(*field_names)
    field_names.map do |field_name|
      [self[field_name].label, self[field_name].value || '']
    end
  end

  def method_missing(name, *args, &block)
    field_name = args.first
    field_name = name unless name == :[]

    field = fields.find { |f| f[:name]&.to_sym == field_name }

    return nil unless field

    OpenStruct.new(field)
  end
end
