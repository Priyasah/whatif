class VotesController < ApplicationController


  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new()
    @vote.answer_id = params[:answer_id]
    
    @vote.vote_type = params[:vote_type]
    @vote.user_id = current_user.id
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def toggle_vote

    @answer = Answer.find(params[:answer_id])
    vote_type= params[:vote_type].to_i
    if(vote_type == 1)

    vote = current_user.votes.where(:answer_id => @answer.id).where(:vote_type => 1).first

  else
     vote = current_user.votes.where(:answer_id => @answer.id).where(:vote_type => 0).first
   end
    if vote
      vote.destroy!
    else
      Vote.create(answer_id: @answer.id , vote_type: vote_type,user_id: current_user.id)
     end
      return redirect_to controller: :home, action: :index
     
    end
   
   

   
end
