class UsersController < ApplicationController

  def index

    if params[:skill].nil?
      @users = User.all
    else
      @users = User.tagged_with(params[:skill])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /Users/1
  # GET /Users/1.json
  def show
    @user = User.find(params[:id])

    client.authorize_from_access(session[:access_token],session[:access_secret])

    @linked_in = client.profile(:id => @user.uid)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

 # GET /Users/1/edit
  def edit
    @User = User.find(params[:id])
  end

  # PUT /Users/1
  # PUT /Users/1.json
  def update
    @User = User.find(params[:id])

    respond_to do |format|
      if @User.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
