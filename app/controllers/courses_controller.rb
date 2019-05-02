class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end
  
  
  # GET /courses/1/locations
  def locations 
    @course = Course.find(params[:id])
    @locations = @course.locations
  end


  # POST /courses/1/location_add?location_id=1
  def course_add
    #Convert ids from routing to objects
    @course = Course.find(params[:id])
    @location = Location.find(params[:course])
    
    unless @course.hosted_in?(@location)
      #add course to list using << operator
      @course.locations << @location
      flash[:notice] = "Course was successfully hosted in #{@location.location}"
    else
      flash[:error] = "Course was already hosted in #{@location.location}"
    end
      redirect_to action: "locations", id: @course
  end
  
  # POST /courses/1/location_remove?location_id=1
  def course_remove
    #Convert ids from routing to object
    @course = Course.find(params[:id])
    
    #get list of courses to remove from query string
    location_ids = params[:locations]
    if location_ids.any?
      location_ids.each do |location_id|
        location = Location.find(location_id)
        if @course.hosted_in?(location)
          logger.info "Removing course from location #{location.id}"
          @course.locations.delete(location)
          flash[:notice] = 'Location was successfully deleted'
        end
      end
    end
    redirect_to action: "locations", id: @course
  end
  
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :prerequisite, :coordinator_id, :likes, :dislikes)
    end
end
