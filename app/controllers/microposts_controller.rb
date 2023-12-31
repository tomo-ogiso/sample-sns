class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[ show update destroy ]

  # GET /microposts
  def index
    @microposts = Micropost.all

    render json: @microposts
  end

  # GET /microposts/1
  def show
    render json: @micropost
  end

  # POST /microposts
  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      render json: @micropost, status: :created, location: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /microposts/1
  def update
    if @micropost.update(micropost_params)
      render json: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /microposts/1
  def destroy
    @micropost.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
