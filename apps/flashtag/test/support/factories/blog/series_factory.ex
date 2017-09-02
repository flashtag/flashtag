defmodule Flashtag.Blog.SeriesFactory do
  defmacro __using__(_opts) do
    quote do
      def blog_series_factory do
        %Flashtag.Blog.Series{
          name: "My awesome blog series!",
          slug: "my-awesome-blog-series",
          description: "Still working on it!",
        }
      end
    end
  end
end
