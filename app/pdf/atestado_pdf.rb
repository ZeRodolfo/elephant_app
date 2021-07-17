class AtestadoPdf < PdfDocument
  def build
    add_document_header('ATESTADO PSICOLÓGICO')

    add_paragraph form.text
    move_down 20

    text "#{form.cidade}, #{form.certificate_at.to_date.to_s}"
    move_down 20

    text patient.user.name
    text form.crp
  end
end
