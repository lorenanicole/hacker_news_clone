post "/postvote/:post_id" do
  @post = Post.find(params[:post_id])
  @post.postvote.update_attributes(votes: (@post.postvote.votes + 1))
  content_type :json
  { :votes => "#{@post.postvote.votes} Votes" }.to_json
end
