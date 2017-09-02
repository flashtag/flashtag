defmodule FlashtagAPI.V1.Blog.SeriesView do
  use FlashtagAPI, :view

  def render("index.json", %{series: series}) do
    %{data: render_many(series, __MODULE__, "series.json")}
  end

  def render("show.json", %{series: series}) do
    %{data: render_one(series, __MODULE__, "series.json")}
  end

  def render("series.json", %{series: series}) do
    %{id: series.id,
      name: series.name,
      slug: series.slug,
      description: series.description}
  end
end
