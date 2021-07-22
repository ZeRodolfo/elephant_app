class LaudosController < ApplicationController
  before_action :set_patient
  before_action :set_laudo, only: [:show, :edit, :update, :destroy]

  def show
    send_data @laudo.pdf.render, filename: 'laudo.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def new
    @laudo = Laudo.new
    @laudo.grafico = Grafico.new
  end

  def edit
  end

  def index
    redirect_to new_patient_laudo_path
  end

  def create
    @laudo = Laudo.new(laudo_params)
    @laudo.patient_id = @patient.id


    uploaded_io = laudo_params[:picture]
    if !uploaded_io.nil?
      dir = File.join(Rails.root, 'storage')
      Dir.mkdir(dir, 0700) unless Dir.exist?(dir)
      
      File.open(File.join(dir, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

    if @laudo.save
      redirect_to patient_formularios_path, notice: 'Laudo criado com sucesso.'
    else
      render :new
    end
  end


  def update
    uploaded_io = laudo_params[:picture]
    picture = ''
    if !uploaded_io.nil?
      dir = File.join(Rails.root, 'public', 'laudos')
      Dir.mkdir(dir, 0700) unless Dir.exist?(dir)

      md5 = Digest::MD5.new
      md5.update "#{uploaded_io.original_filename} - #{DateTime.now}"

      type = uploaded_io.content_type.split("/")
      filename = "#{md5.hexdigest}.#{type[1]}" 
      pathname = File.join(dir, filename)
  
      File.open(pathname, 'wb') do |file|
        file.write(uploaded_io.read)
        
        picture = File.join('laudos', filename)
      end
    end

    if @laudo.update(laudo_params)
      if picture
        @laudo.picture = picture
        @laudo.save
      end

      redirect_to patient_formularios_path, notice: 'Laudo atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @laudo.destroy
    redirect_to patient_formularios_path, notice: 'Laudo excluido com sucesso'
  end

  private
    def set_laudo
      @laudo = current_user.patients.find(@patient.id).laudos.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def laudo_params
      params
        .require(:laudo)
        .permit(
          :analysis,
          :conclusion,
          :crp,
          :description,
          :procedure,
          :references,
          :solicitante,
          :picture,
          :kind,
          grafico_attributes: [:id, :data, :title, :kind, :image]
        )
    end
end
