class RappersController < ApplicationController
  before_action :authenticate_admin
  before_action :set_rapper, only: [:show, :edit, :update, :destroy]

  # GET /rappers
  # GET /rappers.json
  def index
    @rappers = Rapper.all
  end

  # GET /rappers/1
  # GET /rappers/1.json
  def show
  end

  # GET /rappers/new
  def new
    @rapper = Rapper.new
  end

  # GET /rappers/1/edit
  def edit
  end

  # POST /rappers
  # POST /rappers.json
  def create
    @rapper = Rapper.new(rapper_params)

    respond_to do |format|
      if @rapper.save
        format.html { redirect_to @rapper, notice: 'Rapper was successfully created.' }
        format.json { render :show, status: :created, location: @rapper }
      else
        format.html { render :new }
        format.json { render json: @rapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rappers/1
  # PATCH/PUT /rappers/1.json
  def update
    respond_to do |format|
      if @rapper.update(rapper_params)  
        # current_user.lucky_number = rand(1..10000)
        # current_user.add_lucky_number = true
        # current_user.save
        format.html { redirect_to home_admin_path, notice: 'Rapper was successfully updated.' }
        format.json { render :show, status: :ok, location: @rapper }
      else
        format.html { render :edit }
        format.json { render json: @rapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rappers/1
  # DELETE /rappers/1.json
  def destroy 
    @rapper.destroy
    respond_to do |format|
      format.html { redirect_to rappers_url, notice: 'Rapper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @rap = Rapper.find(params[:id])
    if (current_user)
      current_user.voted = true
      current_user.rapper = @rap.name
      current_user.save 
    end
    @rap.upvote_by current_user
    @rap.save
    redirect_back fallback_location: root_path
  end
  # def downvote
  #   @post = Post.find(params[:id])
  #     @post.downvote_by current_user
  #     redirect_back fallback_location: root_path
  #   end

  #set rapper's image
  def set_rapper_image
    @r = Rapper.find(params[:id])
    @r.profile_picture = params[:profile_picture]
    @r.save
    redirect_back(fallback_location: root_path)
  end

  #delete rapper's photo attachment
  def delete_photo_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_back(fallback_location: root_path)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rapper
      @rapper = Rapper.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def rapper_params
      params.require(:rapper).permit(:name, :profile_picture, photos: [])
    end
end
