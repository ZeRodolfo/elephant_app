class PdfsController < ApplicationController
  def office_visit
    respond_to do |format|
      format.pdf { send_office_visit_pdf }
    end
  end
 
  private
 
  def office_visit_pdf
    officeVisit = OfficeVisit.find(params[:office_visit_id])
    OfficeVisitPdf.new(officeVisit, current_user)
  end
 
  def send_office_visit_pdf
    send_file office_visit_pdf.to_pdf,
      filename: office_visit_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end