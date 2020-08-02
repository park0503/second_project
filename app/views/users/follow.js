function getFollow() {
  $("#like-<%=@post.id%>").toggleClass("liked");
  $("#like-<%=@post.id%>").toggleClass("fas");
  $("#like-<%=@post.id%>").toggleClass("far");
  $("#ajaxLikeSize-<%=@post.id%>").html("<%=@post.likes.size%>");
}

getFollow();
