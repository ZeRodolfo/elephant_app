class OfficeVisitsController < ApplicationController
  before_action :set_office_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:index, :edit, :new, :create]


  def index
    @office_visits = @patient.office_visits
                      .order(date: :ASC, hour: :ASC)
  end


  def show
  end


  def new
    @office_visit = OfficeVisit.new
    show_calendar
  end

  def edit
    show_calendar
  end

  def create
    params[:visits] = JSON.parse params[:visits]
    
    OfficeVisit.transaction do
      post_multiple_params[:visits].each do |visit_params|
        OfficeVisit.create!(visit_params.merge(patient_id: @patient.id))
      end
    end

    redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta(s) criada(s) com sucesso.'
  rescue
    
    redirect_to new_office_visit_path(id_patient: @patient, register: true), params: params, notice: 'Erro na criação da(s) consulta(s).'
  end

  def update
    if @office_visit.update(office_visit_params)
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta atualizada com sucesso.'
    else
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Erro na atualização da consulta.'
    end
  end

  def destroy
    @office_visit.destroy
    redirect_to request.referrer, notice: 'Consulta cancelada com sucesso!'
  end

  private

    def show_calendar
      @patients_per_day = OfficeVisit.joins(:patient).where("patients.user_id = ?", current_user.id).order(hour: :ASC).group_by(&:date)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

    def set_patient
      @patient = Patient.find(params[:id_patient])
    end

    def set_office_visit
      @office_visit = OfficeVisit.find(params[:id])
    end

    def post_multiple_params
      params.permit!
    end

    def office_visit_params
      params.require(:office_visit).permit(:patient_id, :value, :date, :hour, :description, {documents: []})
    end
end
