class MembershipsController < ApplicationController

  authorize_resource

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships

    respond_to do |format|
      format.html
      format.json { render json: @memberships }
      format.csv { export_excel_csv(@project, @memberships) }
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

  protected

  # Maybe this works
  def export_excel_csv(project, memberships)
    date = I18n.l(Time.now, :format => :short)
    filename =  "#{date}-#{@project.title.parameterize}-memberships.csv"
    content = Membership.to_csv(memberships, "\t")
    send_data content, :filename => filename
  end

end