class YourfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_yourfile, only: [:show, :edit, :update, :destroy]

  # GET /yourfiles
  # GET /yourfiles.json
  def index
    items_count = params[:items] || 10
    @yourfiles = current_user.yourfiles.order('file_id DESC').paginate(:page => params[:page], :per_page => items_count)
    @yourfile  = current_user.yourfiles.new
  end

  # GET /yourfiles/1
  # GET /yourfiles/1.json
  def show
  end

  # POST /yourfiles
  # POST /yourfiles.json
  def create
    @yourfile = current_user.yourfiles.new(yourfile_params)
    @yourfile.file_id = current_user.yourfiles.all.count + 1

    respond_to do |format|
      if @yourfile.save
        format.html { redirect_to yourfiles_path, notice: 'Yourfile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @yourfile }
      else
        format.html { redirect_to yourfiles_path, notice: 'File empty!' }
        format.json { render json: @yourfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yourfiles/1
  # PATCH/PUT /yourfiles/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yourfile
      @yourfile = Yourfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yourfile_params
      return if !params[:yourfile]
      params.require(:yourfile).permit(:file)
    end
end
