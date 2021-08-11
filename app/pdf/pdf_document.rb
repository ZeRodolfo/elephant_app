require 'prawn/measurement_extensions'

class PdfDocument
  attr_reader :background_image, :options, :pdf, :form, :patient, :current_version

  def initialize(form, patient, background_image: nil, pdf_options: {})
    @form = form
    @patient = patient

    # default_background = user_background || "#{Rails.root.to_s}/app/assets/images/timbrado.jpg"

    @background_image = user_background|| background_image
    @options = {
      page_size: 'A4',
      page_layout: :portrait,
      margin: [50, 75],
      # margin: [120, 75],
      # background: @background_image,
    }.merge!(pdf_options)
    @pdf = Prawn::Document.new(@options)

    @pdf.font_families.update('Times' => {
      normal: Rails.root.join("app/assets/fonts/times.ttf"),
      italic: Rails.root.join("app/assets/fonts/timesi.ttf"),
      bold: Rails.root.join("app/assets/fonts/timesbd.ttf"),
      bold_italic: Rails.root.join("app/assets/fonts/timesbi.ttf")
    })
    @pdf.font "Times"
  end

  def user_background
    image = patient&.user&.user_preference&.papel_timbrado
    return unless image.present? && image.attached?

    @resized_image = MiniMagick::Image.read(image.download)
    suppress(MiniMagick::Error) { @resized_image.resample(72, 72) }

    @resized_image.resize('595x842').path
  end

  def render(*args, **kwargs)
    pdf.render(*args, **kwargs)
  end

  def set_version(version)
    @current_version = version
  end

  protected
    def new_page
      pdf.start_new_page
    end

    def max_width
      pdf.bounds.width
    end

    def add_document_header(header, margin_top: 0)
      # pdf.fill_color "666666"
      pdf.move_down margin_top
      pdf.text header, :size => 16, :style => :bold, :align => :center
      # pdf.text "DATA: #{(Time.now).strftime("%d/%m/%y")}", :align => :right
      pdf.move_down 40
    end

    def add_section(label, margin_top: 20, **kwargs)
      move_down margin_top
      pdf.text label, size: 14, style: :bold, indent_paragraphs: 20, **kwargs
      move_down 5
    end

    def add_paragraph(paragraph)
      pdf.text paragraph, size: 12, indent_paragraphs: 20, align: :justify
      move_down 10
    end

    def add_table(rows, width: max_width)
      pdf.table rows, width: width, cell_style: { size: 8 }
      pdf.move_down 20
    end

    def add_oneline_answer(question, asnwer, prefix: nil)
      pdf.formatted_text [
        *(prefix.present? ? [{ text: prefix, size: 12 }] : []),
        { text: question, size: 12 },
        { text: asnwer || '', size: 12, styles: [:italic] },
      ]
    end

    def add_select(question, options, answer, prefix: nil)
      render_options = options.map do |option|
        {
          text: ("#{option[1]}" == "#{answer}" ? '(x)': '( )') + " #{option[0]} ",
          size: 12
        }
      end

      pdf.formatted_text [
        *(prefix.present? ? [{ text: prefix, size: 12 }] : []),
        { text: "#{question} ", size: 12 },
        *render_options
      ]
    end

    def add_checkbox(label, checked, prefix: nil)
      pdf.formatted_text [
        *(prefix.present? ? [{ text: prefix, size: 12 }] : []),
        { text: (checked == 'true' ? '(x)': '( )') + " #{label}", size: 12 },
      ]
    end

    def add_oneline_answer_alternative(question, asnwer, prefix: nil)
      pdf.formatted_text [
        *(prefix.present? ? [{ text: prefix, size: 12 }] : []),
        { text: "(#{asnwer}) #{question}", size: 12 },
      ]
    end

    def move_down(value)
      pdf.move_down value
    end

    def text(value)
      pdf.text value, size: 12, align: :justify
    end

    def normalize_label(label)
      label + (label[-1] != '?' ? ': ': ' ')
    end

    def render_field(field, prefix: nil, use_alternative: nil)
      if !field.nil? and field.type != 'header'
        case field.type
        when 'text', 'textarea', 'number', 'observation'
          add_oneline_answer(normalize_label(field.label), field.value, prefix: prefix)
        when 'select'
          if use_alternative
            add_oneline_answer_alternative(field.label, field.value, prefix: prefix)
          else
            add_select(field.label, field.options, field.value, prefix: prefix)
          end
        when 'checkbox'
          add_checkbox(field.label, field.value, prefix: prefix)
        when 'add_ask'
          field[:value].each do |item|
            render_field OpenStruct.new(item), prefix: prefix&.next, use_alternative: use_alternative
          end
        end

        move_down 5
      end
    end

    def render_fields(*fields, prefix_enum: nil, use_alternative: nil)
      form.each_field(*fields) do |field|
        render_field field, prefix: prefix_enum&.next, use_alternative: use_alternative
      end
    end

    def add_document_description(header)
      # pdf.fill_color "666666"
      pdf.text header, :size => 13, :style => :normal, :align => :center
      # pdf.text "DATA: #{(Time.now).strftime("%d/%m/%y")}", :align => :right
      pdf.move_down 7
    end

    def add_document_header_logo()
      unless @background_image.nil?
        pdf.image @background_image, position: -35, height: 90, width: 120
        pdf.move_down 10
      end
    end

    def user
      patient&.user
    end

    def render_fields_by_version(identifier, *fields, prefix_enum: nil, use_alternative: nil)
      if @current_version != '1'
        form.each_field_by_version(identifier, *fields) do |field|
          render_field OpenStruct.new(field), prefix: prefix_enum&.next, use_alternative: use_alternative
        end
      else
        render_fields(*fields, prefix_enum, use_alternative)
      end
    end
end
