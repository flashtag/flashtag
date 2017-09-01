defmodule FlashtagAPIWeb.PostView do
  use FlashtagAPIWeb, :view
  alias FlashtagAPIWeb.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      subtitle: post.subtitle,
      slug: post.slug,
      body: post.body,
      description: post.description,
      cover_photo: post.cover_photo,
      photo: post.photo,
      is_published: post.is_published,
      published_at: post.published_at}
  end
end
