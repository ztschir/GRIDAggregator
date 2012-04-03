class NavigationSolutionsController < ApplicationController
  # GET /navigation_solutions
  # GET /navigation_solutions.json
  def index
    @navigation_solutions = NavigationSolution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @navigation_solutions }
    end
  end

  # GET /navigation_solutions/1
  # GET /navigation_solutions/1.json
  def show
    @navigation_solution = NavigationSolution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @navigation_solution }
    end
  end

  # GET /navigation_solutions/new
  # GET /navigation_solutions/new.json
  def new
    @navigation_solution = NavigationSolution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @navigation_solution }
    end
  end

  # GET /navigation_solutions/1/edit
  def edit
    @navigation_solution = NavigationSolution.find(params[:id])
  end

  # POST /navigation_solutions
  # POST /navigation_solutions.json
  def create
    @navigation_solution = NavigationSolution.new(params[:navigation_solution])

    respond_to do |format|
      if @navigation_solution.save
        format.html { redirect_to @navigation_solution, notice: 'Navigation solution was successfully created.' }
        format.json { render json: @navigation_solution, status: :created, location: @navigation_solution }
      else
        format.html { render action: "new" }
        format.json { render json: @navigation_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /navigation_solutions/1
  # PUT /navigation_solutions/1.json
  def update
    @navigation_solution = NavigationSolution.find(params[:id])

    respond_to do |format|
      if @navigation_solution.update_attributes(params[:navigation_solution])
        format.html { redirect_to @navigation_solution, notice: 'Navigation solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @navigation_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navigation_solutions/1
  # DELETE /navigation_solutions/1.json
  def destroy
    @navigation_solution = NavigationSolution.find(params[:id])
    @navigation_solution.destroy

    respond_to do |format|
      format.html { redirect_to navigation_solutions_url }
      format.json { head :no_content }
    end
  end
end
