class PdfsController < ApplicationController
  def office_visit
    respond_to do |format|
      format.pdf { send_office_visit_pdf }
    end
  end
 
  private
 
  def office_visit_pdf
    url = ''
    if current_user.user_preference.papel_timbrado.present? && current_user.user_preference.papel_timbrado.attached?
      url = url_for(current_user.user_preference.papel_timbrado)
    end 

    officeVisit = OfficeVisit.find(params[:office_visit_id])
    OfficeVisitPdf.new(officeVisit, current_user, url)
  end
 
  def send_office_visit_pdf
    send_file office_visit_pdf.to_pdf,
      filename: office_visit_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end