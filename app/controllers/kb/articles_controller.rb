module Kb
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = current_organization.articles.order(created_at: :desc)
    end

    def show
    end

    def new
      @article = current_organization.articles.new
    end

    def create
      @article = current_organization.articles.new(article_params)
      @article.author = current_user
      if @article.save
        redirect_to kb_article_path(@article), notice: "Article created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to kb_article_path(@article), notice: "Article updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
      redirect_to kb_articles_path, notice: "Article deleted successfully."
    end

    private

    def set_article
      @article = current_organization.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :category_id, :status, :content)
    end
  end
end
