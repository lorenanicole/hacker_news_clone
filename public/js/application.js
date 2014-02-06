$(document).ready(function() {
  $('.upvotePost').on('click', function() {
    var url = "/postvote/".concat($(this).attr('data-route'));
    var that = this;
    $.post(url, function(data) {
      $(that).html(data.votes);
    })
  })

  $('.upvoteComment').on('click', function() {
    var url = "/commentvote/".concat($(this).attr('data-route'));
    var that = this;
    $.post(url, function(data) {
      $(that).html(data.votes);
    })
  })
});
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()



