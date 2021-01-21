class FormulariosController < ApplicationController
    before_action :set_patient
    before_action :set_formulario_infantil, only: [:edit_infantil, :update_infantil, :show_infantil]
    before_action :set_formulario_adulto, only: [:edit_adulto, :update_adulto, :show_adulto]
    before_action :set_formulario, only: [:destroy]
    
    def new_infantil
        @form = AnamneseInfantilForm.new
        @model = Formulario.new
    end

    def new_adulto
        @form = AnamneseAdultoForm.new
        @model = Formulario.new
    end

    def create_infantil
        @form = AnamneseInfantilForm.new
        @form.fill(permitted_params)
        @model = Formulario.new
        @model.kind = 'Anamnese Infantil'
        @model.identifier = Formulario::INFANTIL
        @model.content = @form.serialize
        @model.patient_id = @patient.id

        if @model.save
            redirect_to patient_formularios_path(@patient), notice: 'Anamnese Infantil criada com sucesso.'
        else
            render :new_infantil
        end
    end

    def create_adulto
        @form = AnamneseAdultoForm.new
        @form.fill(permitted_params)
        @model = Formulario.new
        @model.kind = 'Anamnese Adulto'
        @model.identifier = Formulario::ADULTO
        @model.content = @form.serialize
        @model.patient_id = @patient.id

        if @model.save
            redirect_to patient_formularios_path(@patient), notice: 'Anamnese Adulto criada com sucesso.'
        else
            render :new_adulto
        end
    end

    def edit_infantil
        @form = AnamneseInfantilForm.new
        @form.deserialize(@model.content)
    end

    def update_infantil
        @form = AnamneseInfantilForm.new
        @form.fill(permitted_params)
        
        if @model.update({ content: @form.serialize })
            redirect_to patient_formularios_path(@patient), notice: 'Anamnese Infantil atualizada com sucesso.'
        else 
            render :edit_infantil
        end
    end

    def update_adulto
        @form = AnamneseAdultoForm.new
        @form.fill(permitted_params)
        
        if @model.update({ content: @form.serialize })
            redirect_to patient_formularios_path(@patient), notice: 'Anamnese Adulto atualizada com sucesso.'
        else 
            render :edit_adulto
        end
    end

    def edit_adulto
        @form = AnamneseAdultoForm.new
        @form.deserialize(@model.content)
    end

    def index_adulto
        redirect_to anamnese_adulto_new_patient_formularios_path
    end

    def index_infantil
        redirect_to anamnese_infantil_new_patient_formularios_path
    end

    def destroy
        @model.destroy
        redirect_to patient_formularios_path(@patient), notice: 'Formulário excluido com sucesso!'
    end

    def index
        @infantis = current_user.patients.find(@patient.id).formularios.where(identifier: Formulario::INFANTIL).order('id ASC')
        @adultos = current_user.patients.find(@patient.id).formularios.where(identifier: Formulario::ADULTO).order('id ASC')
        @relatorios = current_user.patients.find(@patient.id).relatorios.where(patient_id: @patient.id).order('id ASC')
        @laudos = current_user.patients.find(@patient.id).laudos.where(patient_id: @patient.id).order('id ASC')
        @declaracoes = current_user.patients.find(@patient.id).declaracoes.where(patient_id: @patient.id).order('id ASC')
        @pareceres = current_user.patients.find(@patient.id).parecers.where(patient_id: @patient.id).order('id ASC')
        @atestados = current_user.patients.find(@patient.id).atestados.where(patient_id: @patient.id).order('id ASC')
    end

    private
    def permitted_params
        params.except(:utf8, :authenticity_token, :commit, :controller, :action).permit!
    end

    def set_patient
        @patient = current_user.patients.find(params[:patient_id])
    end

    def set_formulario_infantil
        @model = current_user.patients.find(@patient.id).formularios.find_by!(id: params[:formulario_id], identifier: Formulario::INFANTIL)
    end

    def set_formulario
        @model = current_user.patients.find(@patient.id).formularios.find(params[:id])
    end

    def set_formulario_adulto
        @model = current_user.patients.find(@patient.id).formularios.find_by!(id: params[:formulario_id], identifier: Formulario::ADULTO)
    end
end