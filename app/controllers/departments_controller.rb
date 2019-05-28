class DepartmentsController < ApplicationController
before_action :set_department, only: [:show, :edit, :update, :destroy]
  
  def index
      @departments = Department.all
  end

  def show
    @products_by_department = Product.where("id_department = ?", params[:id])
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new (department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: "Departamento criado com sucesso!" }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @department.update (department_params)
        format.html { redirect_to @department, notice: "Departamento alterado com sucesso!" }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to @department, notice: "Departamento removido com sucesso!" }
      format.json { head :no_content }
    end
  end

private

  def set_department
    @department = Department.find_by(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end