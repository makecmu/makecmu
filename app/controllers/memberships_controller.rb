class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.json
  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.json
  def new
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.build(params[:membership])

    respond_to do |format|
      if @membership.save
        format.html { redirect_to [@project, @membership], notice: 'Membership was successfully created.' }
        format.json { render json: @membership, status: :created, location: @membership }
      else
        format.html { render action: "new" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to project_membership_url(@project,@membership) , notice: 'Membership was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to project_memberships_url(@project) }
      format.json { head :ok }
    end
  end
end
