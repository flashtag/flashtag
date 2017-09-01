defmodule FlashtagAPIWeb.SeriesView do
  use FlashtagAPIWeb, :view
  alias FlashtagAPIWeb.SeriesView

  def render("index.json", %{series: series}) do
    %{data: render_many(series, SeriesView, "series.json")}
  end

  def render("show.json", %{series: series}) do
    %{data: render_one(series, SeriesView, "series.json")}
  end

  def render("series.json", %{series: series}) do
    %{id: series.id,
      name: series.name,
      slug: series.slug,
      description: series.description}
  end
end
