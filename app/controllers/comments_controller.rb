class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end
  # GET /comments/1
  # GET /comments/1.json
  def show
  end
  # GET /comments/new
  def new
    @comment = Comment.new
  end
  # GET /comments/1/edit
  def edit
  end
  # POST /comments
  # POST /comments.json
  def create
    @comment = @blog.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      respond_to do |format|
      if @comment.update(comment_params)
        format.js
        format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /comments/1
  # DELETE /comments/1.json

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js 
      format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog  = Blog.find(params[:blog_id])
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:name, :reply, :description)
    end
end
