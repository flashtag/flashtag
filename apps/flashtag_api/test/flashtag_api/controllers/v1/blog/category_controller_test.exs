defmodule FlashtagAPI.V1.Blog.CategoryControllerTest do
  use FlashtagAPI.ConnCase

  alias Flashtag.Blog
  alias Flashtag.Blog.Category

  @create_attrs %{description: "some description", name: "some name", slug: "some slug"}
  @update_attrs %{description: "some updated description", name: "some updated name", slug: "some updated slug"}
  @invalid_attrs %{description: nil, name: nil, slug: nil}

  def fixture(:category) do
    {:ok, category} = Blog.create_category(@create_attrs)
    category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categories", %{conn: conn} do
      conn = get conn, v1_blog_category_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create category" do
    test "renders category when data is valid", %{conn: conn} do
      conn = post conn, v1_blog_category_path(conn, :create), category: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, v1_blog_category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "name" => "some name",
        "slug" => "some slug"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, v1_blog_category_path(conn, :create), category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category" do
    setup [:create_category]

    test "renders category when data is valid", %{conn: conn, category: %Category{id: id} = category} do
      conn = put conn, v1_blog_category_path(conn, :update, category), category: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, v1_blog_category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "name" => "some updated name",
        "slug" => "some updated slug"}
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put conn, v1_blog_category_path(conn, :update, category), category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category" do
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete conn, v1_blog_category_path(conn, :delete, category)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, v1_blog_category_path(conn, :show, category)
      end
    end
  end

  defp create_category(_) do
    category = fixture(:category)
    {:ok, category: category}
  end
end
