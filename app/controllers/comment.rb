post '/createcomment/:post_id' do
  new_comment = Comment.create(content: params[:content], post_id: params[:post_id], user_id: User.find_by_username(session[:username]).id)
  Commentvote.create(comment_id: new_comment.id)
  @all_comments = Post.find(params[:post_id]).comments
  redirect ("/post/#{new_comment.post_id}")
end

get '/comments/:user_id' do
  @user = User.find(params[:user_id])
  @all_comments = @user.comments
  erb :user_comments
end
