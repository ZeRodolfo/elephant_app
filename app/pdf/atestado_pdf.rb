class AtestadoPdf < PdfDocument
  def build
    add_document_header_logo()
    if !user.clinic_name.nil? and !user.clinic_name.empty?
      add_document_description("#{user.clinic_name}")
    end
    add_document_header('ATESTADO PSICOLÓGICO', margin_top: 20)

    add_paragraph form.text
    move_down 20

    text "#{form.cidade}, #{form.certificate_at.to_date.to_s}"
    move_down 20

    text patient.user.name
    text form.crp
  end
end
