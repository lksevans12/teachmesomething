class WelcomeController< ApplicationController

  def index
    @posts = Post.all.get_posts_by_newest.limit(15)
  end
end