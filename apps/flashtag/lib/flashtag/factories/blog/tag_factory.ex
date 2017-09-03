defmodule Flashtag.Blog.TagFactory do
  defmacro __using__(_opts) do
    quote do
      def blog_tag_factory do
        %Flashtag.Blog.Tag{
          name: "My awesome blog tag!",
          slug: "my-awesome-blog-tag",
          description: "Still working on it!",
        }
      end
    end
  end
end
