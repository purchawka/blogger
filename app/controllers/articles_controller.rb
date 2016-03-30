class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new 	
		@comment.article_id = @article.id #Assigning new comment id to a specific article
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article '#{@article.title}' created on #{Time.now}."
		redirect_to article_path(@article) 
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' deleted on #{Time.now}."
		redirect_to articles_path(@articles) 
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Article'#{@article.title}' updated on #{Time.now}."
		redirect_to article_path(@article) 
	end
	private
	def article_params
  		params.require(:article).permit(:title, :body)
	end
end
