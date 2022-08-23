class LesssonsController < ApplicationController
  before_action :set_lessson, only: %i[ show edit update destroy ]

  # GET /lesssons or /lesssons.json
  def index
    @lesssons = Lessson.all
  end

  # GET /lesssons/1 or /lesssons/1.json
  def show
  end

  # GET /lesssons/new
  def new
    @lessson = Lessson.new
  end

  # GET /lesssons/1/edit
  def edit
  end

  # POST /lesssons or /lesssons.json
  def create
    @lessson = Lessson.new(lessson_params)

    respond_to do |format|
      if @lessson.save
        format.html { redirect_to lessson_url(@lessson), notice: "Lessson was successfully created." }
        format.json { render :show, status: :created, location: @lessson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lessson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesssons/1 or /lesssons/1.json
  def update
    respond_to do |format|
      if @lessson.update(lessson_params)
        format.html { redirect_to lessson_url(@lessson), notice: "Lessson was successfully updated." }
        format.json { render :show, status: :ok, location: @lessson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lessson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesssons/1 or /lesssons/1.json
  def destroy
    @lessson.destroy

    respond_to do |format|
      format.html { redirect_to lesssons_url, notice: "Lessson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lessson
      @lessson = Lessson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lessson_params
      params.require(:lessson).permit(:title, :content, :course_id)
    end
end
