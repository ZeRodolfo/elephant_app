class CalendarController < ApplicationController
	def index
		@patients_per_day = OfficeVisit.joins(:patient).where("patients.user_id = ?", current_user.id).order(date: :ASC, hour: :ASC)
    	@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end	
end
