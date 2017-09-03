defmodule Flashtag.Blog.PostFactory do
  defmacro __using__(_opts) do
    quote do
      def blog_post_factory do
        %Flashtag.Blog.Post{
          title: "My awesome blog post!",
          subtitle: "It's the best",
          slug: "my-awesome-blog-post",
          body: "Still working on it!",
          description: "So much good",
          cover_photo: "https://pixl.it",
          photo: "https://pixl.it",
          is_published: true,
          published_at: ~N[2017-08-15 14:00:00.000000],
          unpublished_at: nil,
          series: build(:blog_series),
          category: build(:blog_category),
          tags: build_list(2, :blog_tag),
          user: build(:accounts_user),
        }
      end
    end
  end
end
