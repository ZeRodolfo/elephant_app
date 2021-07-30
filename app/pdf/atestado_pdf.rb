class AtestadoPdf < PdfDocument
  def build
    add_document_header_logo()
    add_document_description("SETOR DE PSICOLOGIA APLICADA – SPA")
    add_document_description("CLÍNICA DE #{user.clinic_name}")
    
    add_document_header('ATESTADO PSICOLÓGICO', margin_top: 20)

    add_paragraph form.text
    move_down 20

    text "#{form.cidade}, #{form.certificate_at.to_date.to_s}"
    move_down 20

    text patient.user.name
    text form.crp
  end
end
