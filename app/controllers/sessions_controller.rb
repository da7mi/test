class SessionsController < ApplicationController
  def index
    render "new"
  end
  
  def register
    @user = User.new
    respond_to do |format|
      format.html { render action: "register" }
      format.json { render json: @user }
    end
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to params[:referer], notice: 'Post was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "register" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def login
    user = User.find_by_account(params[:account])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.account_name
      redirect_to params[:referer]
    else
      flash.alert = 'Invalid'
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
