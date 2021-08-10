require "render_anywhere"
 
class OfficeVisitPdf
  include RenderAnywhere
 
  def initialize(office_visit, current_user, logotipo)
    @office_visit = office_visit
    @current_user = current_user
    @logotipo = logotipo
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/office_visit.pdf")
  end
 
  def filename
    "office_visit #{office_visit.id}.pdf"
  end

  private
 
    attr_reader :office_visit, :current_user, :logotipo
 
    def as_html
      render template: "office_visits/pdf", layout: "pdf", locals: { office_visit: office_visit, current_user: current_user, logotipo: logotipo }
    end
end