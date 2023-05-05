class SittingRequestsController < ApplicationController
  before_action :set_sitting_request, only: %i[ show edit update destroy confirmation confirmed change_status]
  before_action :set_available_animals, only: %i[new create edit update]
  before_action :get_sitting_requests, only: %i[index]

  # GET /sitting_requests or /sitting_requests.json
  def index
  end

  # GET /sitting_requests/1 or /sitting_requests/1.json
  def show
  end

  # GET /sitting_requests/new
  def new
    @sitting_request = SittingRequest.new
  end

  # GET /sitting_requests/1/edit
  def edit
    @animals = Animal.all.map{|animal| [animal.animal_type, animal.id]}
  end

  # POST /sitting_requests or /sitting_requests.json
  def create
    @sitting_request = SittingRequest.new(sitting_request_params)
    respond_to do |format|
      if @sitting_request.save
        # update record costs
        @sitting_request.update(cost: CostCalculator.call(@sitting_request))

        format.html { redirect_to confirmation_sitting_request_path(@sitting_request)}
        format.json { redirect_to confirmation_sitting_request_path(@sitting_request) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sitting_request.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /sitting_requests/1 or /sitting_requests/1.json
  def update
    respond_to do |format|
      if @sitting_request.update(sitting_request_params)
        # update record costs
        @sitting_request.update(cost: CostCalculator.call(@sitting_request))

        format.html { redirect_to confirmation_sitting_request_path(@sitting_request)}
        format.json { redirect_to confirmation_sitting_request_path(@sitting_request) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sitting_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirmation
  end

  def confirmed
    # move me to a model
    @sitting_request.update(request_status: 'pending acceptance')
    redirect_to sitting_requests_path
  end

  # DELETE /sitting_requests/1 or /sitting_requests/1.json
  def destroy
    @sitting_request.destroy

    respond_to do |format|
      format.html { redirect_to sitting_requests_url, notice: "Sitting request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change_status
    @sitting_request.update(request_status: params[:new_status])
    flash[:alert] = "Your update has been made"
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitting_request
      @sitting_request = SittingRequest.find(params[:id])
    end

    def set_available_animals
      @animals = Animal.all.map{|animal| [animal.animal_type, animal.id]}
    end

    def get_sitting_requests
      if current_user.employee?
        @sitting_requests = SittingRequest.all.order(:drop_off)
      else
        @sitting_requests = SittingRequest.where(user_id: current_user.id).order(:drop_off)
      end
    end

    # Only allow a list of trusted parameters through.
    def sitting_request_params
      params.require(:sitting_request).permit(:user_id, :pet_name, :animal_id, :drop_off, :pickup, :request_status, :cost)
    end
end
