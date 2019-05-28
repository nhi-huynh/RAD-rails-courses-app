class CoordinatorsController < ApplicationController
  before_action :logged_in_coordinator, only: [:edit, :update]
  before_action :correct_coordinator,   only: [:edit, :update]
  before_action :confirm_admin,     only: :destroy
  before_action :set_coordinator , only: [:show, :edit, :update, :destroy]
  
  # GET /coordinators
  # GET /coordinators.json
  def index
    @coordinators = Coordinator.all
  end

  # GET /coordinators/1
  # GET /coordinators/1.json
  def show
    @coordinator = Coordinator.find(params[:id])
  end

  # GET /coordinators/new
  def new
    @coordinator = Coordinator.new
  end

  # GET /coordinators/1/edit
  def edit
    @coordinator = Coordinator.find(params[:id])
  end

  # POST /coordinators
  # POST /coordinators.json
  def create
    @coordinator = Coordinator.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        log_in @coordinator
        remember @coordinator
        format.html { redirect_to @coordinator, notice: 'Coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coordinators/1
  # PATCH/PUT /coordinators/1.json
  def update
    respond_to do |format|
      if @coordinator.update(coordinator_params)
        format.html { redirect_to @coordinator, notice: 'Coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /coordinators/1
  # DELETE /coordinators/1.json
  # Only admin can delete a user
  def destroy
    #Coordinator.find(params[:id]).destroy
    @coordinator.destroy
    respond_to do |format|
      format.html { redirect_to coordinators_url, notice: 'Coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Confirms the correct user.
  def correct_coordinator
    @coordinator = Coordinator.find(params[:id])
    redirect_to(root_url) unless current_coordinator?(@coordinator)
  end
  
    # Confirms a logged-in user.
  def logged_in_coordinator
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = Coordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password, :password_confirmation, :photo_url)
    end
    
    # Confirms an admin user.
    def confirm_admin
      redirect_to(root_url) unless current_coordinator.is_admin?
    end
end

