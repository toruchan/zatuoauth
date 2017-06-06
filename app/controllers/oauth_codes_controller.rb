class OauthCodesController < ApplicationController
  before_action :set_oauth_code, only: [:show, :edit, :update, :destroy]

  # GET /oauth_codes
  # GET /oauth_codes.json
  def index
    @oauth_codes = OauthCode.all
  end

  # GET /oauth_codes/1
  # GET /oauth_codes/1.json
  def show
  end

  # GET /oauth_codes/new
  def new
    @oauth_code = OauthCode.new
  end

  # GET /oauth_codes/1/edit
  def edit
  end

  # POST /oauth_codes
  # POST /oauth_codes.json
  def create
    @oauth_code = OauthCode.new(oauth_code_params)

    respond_to do |format|
      if @oauth_code.save
        format.html { redirect_to @oauth_code, notice: 'Oauth code was successfully created.' }
        format.json { render :show, status: :created, location: @oauth_code }
      else
        format.html { render :new }
        format.json { render json: @oauth_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oauth_codes/1
  # PATCH/PUT /oauth_codes/1.json
  def update
    respond_to do |format|
      if @oauth_code.update(oauth_code_params)
        format.html { redirect_to @oauth_code, notice: 'Oauth code was successfully updated.' }
        format.json { render :show, status: :ok, location: @oauth_code }
      else
        format.html { render :edit }
        format.json { render json: @oauth_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oauth_codes/1
  # DELETE /oauth_codes/1.json
  def destroy
    @oauth_code.destroy
    respond_to do |format|
      format.html { redirect_to oauth_codes_url, notice: 'Oauth code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oauth_code
      @oauth_code = OauthCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oauth_code_params
      params.require(:oauth_code).permit(:user_id, :oauth_code, :expire_oauth_code)
    end
end
