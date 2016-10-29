class HomeController < ApplicationController
  def index
  	@projects = Project.all
    @post = Post.find_by(title: "index")
  end

  def shop
    @projects = Project.where.not(price: nil)
  end

  def shopitem
    @project = Project.find(params[:id])
  end

  def about
    @post = Post.find_by(title: "about")
  end

  def terms
    @post = Post.find_by(title: "terms")
  end

  def imprint
    @post = Post.find_by(title: "imprint")
  end

  def contact
    @post = Post.find_by(title: "contact")
  end
end
