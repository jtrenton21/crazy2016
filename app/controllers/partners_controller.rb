class PartnersController < ApplicationController
  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all

    
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
    @partner = Partner.find(params[:id])

    
  end

  # GET /partners/new
  # GET /partners/new.json
  def new
    @partner = Partner.new

  end

  # GET /partners/1/edit
  def edit
    @partner = Partner.find(params[:id])
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(params[:partner])
    
      if @partner.save
       redirect_to user_root_path
      else
        redirect_to user_root_path
      end
  end

  # PUT /partners/1
  # PUT /partners/1.json
  def update
    @partner = Partner.find(params[:id])

    
      if @partner.update_attributes(params[:partner])
       redirect_to user_root_path
      
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to user_root_path
  end
end
