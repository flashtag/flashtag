defmodule FlashtagAPI.V1.Blog.TagView do
  use FlashtagAPI, :view

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, __MODULE__, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{data: render_one(tag, __MODULE__, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{id: tag.id,
      name: tag.name,
      slug: tag.slug,
      description: tag.description}
  end
end
