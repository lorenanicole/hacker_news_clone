get '/' do
  @all_posts = Post.all
  erb :index
end

get '/createpost' do
  erb :createpost
end

post '/createpost' do
  new_post = Post.create(title: params[:title], url: params[:url], user_id: User.find_by_username(session[:username]).id)
  Postvote.create(post_id: new_post.id)
  redirect("/post/#{new_post.id}")
end

get '/post/:post_id' do
  @view_post = Post.find(params[:post_id])
  @author = User.find(@view_post.user_id).username
  @all_comments = @view_post.comments
  erb :post
end

get '/posts/:user_id' do
  @user = User.find(params[:user_id])
  @all_posts = @user.posts
  erb :user_posts
end
