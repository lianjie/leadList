class ContractGroupsController < ApplicationController
  # GET /contract_groups
  # GET /contract_groups.json
  def index
    @contract_groups = ContractGroup.all
    #$list = ""
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contract_groups }
    end
  end

  # GET /contract_groups/1
  # GET /contract_groups/1.json
  def show
    @contract_group = ContractGroup.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract_group }
    end
  end

  # GET /contract_groups/new
  # GET /contract_groups/new.json
  def new
    @contract_group = ContractGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract_group }
    end
  end

  # GET /contract_groups/1/edit
  def edit
    @contract_group = ContractGroup.find(params[:id])
  end

  # POST /contract_groups
  # POST /contract_groups.json
  
  def create
    @contract_group = ContractGroup.new(params[:contract_group])
    unless request.get?
      if 0!=$list.index("{")
        $list = "{"
      else
        $list = $list.chop
        $list += ","
      end
      if file = @contract_group.uploadFile(params[:file]['file'])
         i = 1
         group = "["
         while i<file.length
           data = file[i].split(",")
           group += "{\"name\":\"" + data[0]
           group += "\",\"phone\":\"" + data[1]
           group += "\"},"
           i += 1
         end
         group = group.chop
         group += "]" 
         $list += "\"" + params[:contract_group]['group_name']
         $list += "\":"
         $list += group
      end
    end
    $list += "}"
    
    respond_to do |format|
      if @contract_group.save
        format.html { redirect_to @contract_group, notice: 'Contract group was successfully created.' }
        format.json { render json: @contract_group, status: :created, location: @contract_group }
      else
        format.html { render action: "new" }
        format.json { render json: @contract_group.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /contract_groups/1
  # PUT /contract_groups/1.json
  def update
    @contract_group = ContractGroup.find(params[:id])

    respond_to do |format|
      if @contract_group.update_attributes(params[:contract_group])
        format.html { redirect_to @contract_group, notice: 'Contract group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_groups/1
  # DELETE /contract_groups/1.json
  def destroy
    @contract_group = ContractGroup.find(params[:id])
    @contract_group.destroy

    respond_to do |format|
      format.html { redirect_to contract_groups_url }
      format.json { head :no_content }
    end
  end
end
