class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :set_view, only: %i[ index update]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
    @tasks = Task.where(list_id: @list.id)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    if List.where(title: list_params[:title]) == []
      respond_to do |format|
        if list_params[:title].present? && @list.save
          format.html { redirect_to root_path }
        else
          format.html { redirect_to request.referrer, notice: "Title is a required attribute" }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if list_params[:title].present? && @list.update(list_params) 
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { redirect_to request.referrer, notice: "Title is a required attribute"}
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!
    respond_to do |format|
      format.html { redirect_to lists_path(view: params[:view]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id].present? ? params[:id] : params[:list_id])
    end

    def set_view
      @view = params[:view].present? ? params[:view] : ""
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title, :description, :category)
    end
end
