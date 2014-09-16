class SiteContactsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_site_contact, only: [:show, :edit, :update, :destroy]

  # GET /site_contacts
  # GET /site_contacts.json
  def index
    @site_contacts = SiteContact.all
  end

  # GET /site_contacts/1
  # GET /site_contacts/1.json
  def show
  end

  # GET /site_contacts/new
  def new
    @site_contact = SiteContact.new
  end

  # GET /site_contacts/1/edit
  def edit
  end

  # POST /site_contacts
  # POST /site_contacts.json
  def create
    @site_contact = SiteContact.new(site_contact_params)

    respond_to do |format|
      if @site_contact.save
        format.html { redirect_to @site_contact, notice: 'Site contact was successfully created.' }
        format.json { render :show, status: :created, location: @site_contact }
      else
        format.html { render :new }
        format.json { render json: @site_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_contacts/1
  # PATCH/PUT /site_contacts/1.json
  def update
    respond_to do |format|
      if @site_contact.update(site_contact_params)
        format.html { redirect_to @site_contact, notice: 'Site contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_contact }
      else
        format.html { render :edit }
        format.json { render json: @site_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_contacts/1
  # DELETE /site_contacts/1.json
  def destroy
    @site_contact.destroy
    respond_to do |format|
      format.html { redirect_to site_contacts_url, notice: 'Site contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_contact
      @site_contact = SiteContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_contact_params
      params.require(:site_contact).permit(:site_id, :email, :qq, :phone, :is_processed, :note)
    end
end
