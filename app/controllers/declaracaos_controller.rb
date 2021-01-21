class DeclaracaosController < ApplicationController
  before_action :set_declaracao, only: [:show, :edit, :update, :destroy]

  # GET /declaracaos
  # GET /declaracaos.json
  def index
    @declaracaos = Declaracao.all
  end

  # GET /declaracaos/1
  # GET /declaracaos/1.json
  def show
  end

  # GET /declaracaos/new
  def new
    @declaracao = Declaracao.new
  end

  # GET /declaracaos/1/edit
  def edit
  end

  # POST /declaracaos
  # POST /declaracaos.json
  def create
    @declaracao = Declaracao.new(declaracao_params)

    respond_to do |format|
      if @declaracao.save
        format.html { redirect_to @declaracao, notice: 'Declaracao was successfully created.' }
        format.json { render :show, status: :created, location: @declaracao }
      else
        format.html { render :new }
        format.json { render json: @declaracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declaracaos/1
  # PATCH/PUT /declaracaos/1.json
  def update
    respond_to do |format|
      if @declaracao.update(declaracao_params)
        format.html { redirect_to @declaracao, notice: 'Declaracao was successfully updated.' }
        format.json { render :show, status: :ok, location: @declaracao }
      else
        format.html { render :edit }
        format.json { render json: @declaracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declaracaos/1
  # DELETE /declaracaos/1.json
  def destroy
    @declaracao.destroy
    respond_to do |format|
      format.html { redirect_to declaracaos_url, notice: 'Declaracao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_declaracao
      @declaracao = Declaracao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def declaracao_params
      params.fetch(:declaracao, {})
    end
end
