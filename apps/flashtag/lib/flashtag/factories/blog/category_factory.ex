defmodule Flashtag.Blog.CategoryFactory do
  defmacro __using__(_opts) do
    quote do
      def blog_category_factory do
        %Flashtag.Blog.Category{
          name: "My awesome blog category!",
          slug: "my-awesome-blog-category",
          description: "Still working on it!",
        }
      end
    end
  end
end
