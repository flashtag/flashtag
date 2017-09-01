defmodule FlashtagAPIWeb.SeriesController do
  use FlashtagAPIWeb, :controller

  alias Flashtag.Blog
  alias Flashtag.Blog.Series

  action_fallback FlashtagAPIWeb.FallbackController

  def index(conn, _params) do
    series = Blog.list_series()
    render(conn, "index.json", series: series)
  end

  def create(conn, %{"series" => series_params}) do
    with {:ok, %Series{} = series} <- Blog.create_series(series_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", series_path(conn, :show, series))
      |> render("show.json", series: series)
    end
  end

  def show(conn, %{"id" => id}) do
    series = Blog.get_series!(id)
    render(conn, "show.json", series: series)
  end

  def update(conn, %{"id" => id, "series" => series_params}) do
    series = Blog.get_series!(id)

    with {:ok, %Series{} = series} <- Blog.update_series(series, series_params) do
      render(conn, "show.json", series: series)
    end
  end

  def delete(conn, %{"id" => id}) do
    series = Blog.get_series!(id)
    with {:ok, %Series{}} <- Blog.delete_series(series) do
      send_resp(conn, :no_content, "")
    end
  end
end
