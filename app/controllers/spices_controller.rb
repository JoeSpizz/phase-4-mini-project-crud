class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # GET /spices
  def index
    spices = Spice.all

    render json: spices
  end

  # GET /spices/1
  def show
    spice = Spice.find_by(id: params[:id])
    render json: spice
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
   end

  # PATCH/PUT /spices/1
  def update
   spice = Spice.find_by(id: params[:id])
    spice.update(spice_params)
    render json: spice, status: :accepted
  end

  # DELETE /spices/1
  def destroy
    spice = Spice.find_by(id: params[:id])
    spice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def render_not_found_response
      render json: { error: "Spice not found" }, status: :not_found
    end
    # Only allow a list of trusted parameters through.
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
end
