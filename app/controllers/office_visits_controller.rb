require 'activeform-rails'
require 'mutiple_office_visits_form'

class OfficeVisitsController < ApplicationController
  include DateHelper
  before_action :set_office_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:index, :edit, :new, :create, :create_multiple]


  def index
    @office_visits = @patient.office_visits
                      .order(date: :ASC, hour: :ASC)
  end


  def show
  end


  def new
    @office_visit = OfficeVisit.new
    @form = MultipleOfficeVisitsForm.new(id_patient: @patient.id)
    show_calendar
  end

  def edit
    show_calendar
  end

  def create
    @office_visit = OfficeVisit.new(office_visit_params)
    @office_visit.patient = @patient

    if @office_visit.save
      redirect_to request.referrer, notice: 'Consulta criada com sucesso!'
    else
      render :new # Todo: Fix me!
    end
  end

  def create_multiple
    @form = MultipleOfficeVisitsForm.new(id_patient: @patient.id)
    @form.fill_attributes(create_multiple_params)
    # byebug

    unless @form.valid? then
      render :new # Todo: Fix me!
      return
    end

    dates_to_repeat = Array.new
    repetition = @form.repetition.to_i

    if repetition == 0 then
      office_visit = OfficeVisit.new(date: @form.start_date, hour: @form.hour, patient_id: @form.id_patient)  
      if office_visit.save
        redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta(s) criada(s) com sucesso.'
      else
        render :new
        return
      end
    else
      start_date = DateHelper.parse(@form.start_date)
      end_date = DateHelper.parse(@form.end_date)

      if repetition == 1 then
        dates_to_repeat = DateHelper.repeat_weekly(start_date, end_date)
      elsif repetition == 2 then
        dates_to_repeat = DateHelper.repeat_quinzenally(start_date, end_date)
      elsif repetition == 3 then
        dates_to_repeat = DateHelper.repeat_monthly(start_date, end_date)
      end
    end

    visits_to_create = dates_to_repeat.map { |visit|
      {
        date: visit.to_s,
        hour: @form.hour,
        patient_id: @patient.id
      }
    }

    OfficeVisit.transaction do
      visits_to_create.each do |visit_param|
        OfficeVisit.create!(visit_param)
      end
    end

  redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta(s) criada(s) com sucesso.'

  rescue
    render :new # Todo: Fix me! notice: 'Erro ao criar consulta(s). Por favor, confira os campos.'
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

    def create_multiple_params
      params.require(:multiple_office_visits_form).permit(:repetition, :start_date, :end_date, :hour)
    end

    def office_visit_params
      params.require(:office_visit).permit(:patient_id, :value, :date, :hour, :description, {documents: []})
    end
end
