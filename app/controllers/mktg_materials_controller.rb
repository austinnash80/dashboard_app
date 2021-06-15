class MktgMaterialsController < ApplicationController
  before_action :set_mktg_material, only: %i[ show edit update destroy ]

  # GET /mktg_materials or /mktg_materials.json
  def index
    @mktg_materials = MktgMaterial.all

    # DELETE ALL
    if params['remove_all'] == 'yes' && params['confirm'] == 'yes'
      MktgMaterial.delete_all
      redirect_to mktg_materials_path(), notice: 'Records Deleted'
    end

    # EXPORT
    respond_to do |format|
      format.html
      format.csv { send_data @mktg_materials.to_csv, filename: "mktg_material-#{Date.today}.csv" }
    end

  end

  # GET /mktg_materials/1 or /mktg_materials/1.json
  def show
  end

  # GET /mktg_materials/new
  def new
    @mktg_material = MktgMaterial.new
  end

  # GET /mktg_materials/1/edit
  def edit
  end

  # POST /mktg_materials or /mktg_materials.json
  def create
    @mktg_material = MktgMaterial.new(mktg_material_params)

    respond_to do |format|
      if @mktg_material.save
        format.html { redirect_to @mktg_material, notice: "Mktg material was successfully created." }
        format.json { render :show, status: :created, location: @mktg_material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mktg_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mktg_materials/1 or /mktg_materials/1.json
  def update
    respond_to do |format|
      if @mktg_material.update(mktg_material_params)
        format.html { redirect_to @mktg_material, notice: "Mktg material was successfully updated." }
        format.json { render :show, status: :ok, location: @mktg_material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mktg_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mktg_materials/1 or /mktg_materials/1.json
  def destroy
    @mktg_material.destroy
    respond_to do |format|
      format.html { redirect_to mktg_materials_url, notice: "Mktg material was successfully destroyed." }
      format.json { head :no_content }
    end
  end


    def import #Uploading CSV function
      MktgMaterial.my_import(params[:file])
      redirect_to mktg_materials_path, notice: "Upload Complete"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mktg_material
      @mktg_material = MktgMaterial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mktg_material_params
      params.require(:mktg_material).permit(:co, :campaign, :name, :land_date, :delivered_to, :quantity, :link_name)
    end
end
