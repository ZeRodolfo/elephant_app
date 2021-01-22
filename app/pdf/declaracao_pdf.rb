class DeclaracaoPdf < PdfDocument
  def build
    add_document_header('DECLARAÇÃO')

    add_paragraph form.text
    move_down 20

    text "#{form.city}, #{form.created_at.to_date.to_s}"
    move_down 20

    text patient.user.name
    text form.crp
  end
end
