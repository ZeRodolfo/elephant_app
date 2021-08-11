class BaseForm
  attr_reader :fields #, :version

  def initialize
    @fields = []
    # @version = '2'
  end

  def transform_dynamics_values(data)
    data.each do |d|
      @fields.each do |fields|
        fields[:column_left].each do |f|
          if f[:type] == 'add_ask' and d[0].include? f[:name]
            label = d[0].gsub(f[:name], '').gsub('_', ' ')
            f[:values].push({
              name: d[0],
              value: d[1],
              type: 'text',
              label: label
            })
          end
        end

        fields[:column_right].each do |f|
          if f[:type] == 'add_ask' and d[0].include? f[:name]
            label = d[0].gsub(f[:name], '').gsub('_', ' ')
            f[:values].push({
              name: d[0],
              value: d[1],
              type: 'text',
              label: label
            })
          end
        end
      end
    end
  end
  
  def fill(data, current_version = '1')
    self.transform_dynamics_values(data)
  
    data.each do |d|
      if d[0].present?
        if current_version != '1'
          @fields.each do |fields|
            field = fields[:column_left].detect { |f| 
              if f[:type] == 'add_ask'
                f[:values].detect { |v| v[:name] == d[0] }
              else
                f[:name] == d[0] 
              end
            }

            if field.nil?
              field = fields[:column_right].detect { |f| 
                if f[:type] == 'add_ask'
                  f[:values].detect { |v| v[:name] == d[0] }
                else
                  f[:name] == d[0] 
                end
              }
            end

            unless field.nil?
              field[:value] = (field[:type] == "text" || field[:type] == "textarea") ? d[1].chomp : d[1]
            end
          end
        else 
          field = @fields.detect { |f| f[:name] == d[0] }

          unless field.nil?
            field[:value] = (field[:type] == "text" || field[:type] == "textarea") ? d[1].chomp : d[1]
          end
        end
      end
    end
  end

  def serialize
    @fields.each_with_object({}) { |f, hash| hash[f[:name]] = { column_left: f[:column_left].each_with_object({}) { |f2, hash2| f2[:type] != 'add_ask' ? hash2[f2[:name]] = f2[:value] : hash2[f2[:name]] = f2[:values].each_with_object({}) { |f3, hash3| hash3[f3[:name]] = f3[:value] }.to_json }.to_json, column_right: f[:column_right].each_with_object({}) { |f2, hash2| hash2[f2[:name]] = f2[:value] }.to_json } }.to_json
  end

  def valid_hash?(string)
    puts 'string', string, 'foi'
    !string.nil? ? eval(string).is_a?(Hash) : false
  # rescue SyntaxError
  #   false
  end

  def convert_value_element_to_hash(element) 
    data = []
    element[1] = JSON.parse(element[1])
    element[1].to_a.each do |item|
      label = item[0].gsub(element[0], '').gsub('_', ' ')
      if !label.empty?
        data.push({
          name: item[0],
          value: item[1],
          type: 'text',
          label: label
        })
      end 
    end

    return data
  end

  def deserialize(data_json, current_version = '1')
    data = JSON.parse(data_json)
    values = []

    if current_version != '1'
      data.to_a.each do |f|
        item = f[1].to_a

        column_left = JSON.parse(item[0][1])
        column_left = column_left.to_a.each do |element|
          if valid_hash?(element[1])
            element[1] = convert_value_element_to_hash(element)
          end
        end

        column_right = JSON.parse(item[1][1])
        column_right = column_right.to_a.each do |element|
          if valid_hash?(element[1])
            element[1] = convert_value_element_to_hash(element)
          end
        end
  
        values.concat(column_left).concat(column_right)
      end
    else 
      values = data.to_a
    end

    self.fill(values, current_version)
  end

  def clear
    @fields.each { |f| f.except!(:value) }
  end

  def each_field(*field_names, &block)
    field_names.each do |field_name|
      block.call self[field_name]
    end
  end

  def each_field_by_version(identifier, *field_names, &block)
    field_names.each do |field_name|
      field = self[identifier.to_sym][:column_left].detect { |f| 
        if f[:type] == 'add_ask'
          f[:values].detect { |g| g[:name].include? field_name.to_s }
        else
          f[:name] == field_name.to_s
        end
      }

      if field.nil?
        field = self[identifier.to_sym][:column_right].detect { |f| 
          if f[:type] == 'add_ask'
            f[:values].detect { |g| g[:name].include? field_name.to_s }
          else
            f[:name] == field_name.to_s
          end
        }
      end

      block.call field
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
