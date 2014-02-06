post "/commentvote/:comment_id" do
  @comment = Comment.find(params[:comment_id])
  @comment.commentvote.update_attributes(votes: (@comment.commentvote.votes + 1))
  content_type :json
  { :votes => "#{@comment.commentvote.votes} Votes" }.to_json
end
