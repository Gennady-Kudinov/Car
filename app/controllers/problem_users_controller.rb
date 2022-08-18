class ProblemUsersController < ApplicationController

  def new
  end

  def index
    @problem_user = ProblemUser.where(problem_users: params[:search])
  end

  def show
    @problem_user = Client.find(params[:id])
  end

  def create
    #  @problem_user = Problem_user.new(params[:problem_user])
    # if @problem_user.valid?
    #  @problem_user.save

      @client = Client.new(client_params)
      @params = params[:problem_user_attributes]
      if @client.valid?
        @client.save

      redirect_to @problem_user

    else
      render action: 'new'
    end
  end


end
