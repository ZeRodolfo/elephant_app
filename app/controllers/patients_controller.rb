class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy, :graph, :validation]

  def index
    @patients = current_user.patients.order(name: :ASC)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    if @patient.save
      redirect_to patients_path, notice: 'Candidato Salvo com sucesso!'
    else
      render :new
    end
  end

  def graph
    @patient_graph = @patient.form.psicological_concepts

    @patient_concept_sum = @patient.form.psicological_concepts.sum
  end

  def edit
  end

  def update
    code = patient_params[:code].present? ? patient_params[:code] : @patient.code
    if @patient.update(patient_params.merge({ code: code }))
      redirect_to patients_path, notice: 'Candidato Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def validation
  end

  def validate
    @patient = Patient.find(params[:id_patient])

    if @patient.validate_code(params[:patient][:code].to_s)
      redirect_to patient_office_visits_path(@patient), notice: 'Autenticação realizada!'
    else
      redirect_to request.referrer, alert: 'Senha Inválida!'
    end
  end


  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: 'Cliente removido com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro na remoção do cliente!'
    end
  end


  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:avatar, :birth_date, :code, :gender, :name, :phone, :profession, :relative_phone)
  end
end
