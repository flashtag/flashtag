defmodule FlashtagAPI.V1.Blog.SeriesControllerTest do
  use FlashtagAPI.ConnCase

  alias Flashtag.Blog
  alias Flashtag.Blog.Series

  @create_attrs %{description: "some description", name: "some name", slug: "some slug"}
  @update_attrs %{description: "some updated description", name: "some updated name", slug: "some updated slug"}
  @invalid_attrs %{description: nil, name: nil, slug: nil}

  def fixture(:series) do
    {:ok, series} = Blog.create_series(@create_attrs)
    series
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all series", %{conn: conn} do
      conn = get conn, v1_blog_series_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create series" do
    test "renders series when data is valid", %{conn: conn} do
      conn = post conn, v1_blog_series_path(conn, :create), series: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, v1_blog_series_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "name" => "some name",
        "slug" => "some slug"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, v1_blog_series_path(conn, :create), series: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update series" do
    setup [:create_series]

    test "renders series when data is valid", %{conn: conn, series: %Series{id: id} = series} do
      conn = put conn, v1_blog_series_path(conn, :update, series), series: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, v1_blog_series_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "name" => "some updated name",
        "slug" => "some updated slug"}
    end

    test "renders errors when data is invalid", %{conn: conn, series: series} do
      conn = put conn, v1_blog_series_path(conn, :update, series), series: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete series" do
    setup [:create_series]

    test "deletes chosen series", %{conn: conn, series: series} do
      conn = delete conn, v1_blog_series_path(conn, :delete, series)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, v1_blog_series_path(conn, :show, series)
      end
    end
  end

  defp create_series(_) do
    series = fixture(:series)
    {:ok, series: series}
  end
end
