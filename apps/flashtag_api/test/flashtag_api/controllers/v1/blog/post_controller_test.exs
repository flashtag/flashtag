defmodule FlashtagAPI.V1.Blog.PostControllerTest do
  use FlashtagAPI.ConnCase

  alias Flashtag.Blog
  alias Flashtag.Blog.Post

  @create_attrs %{body: "some body", cover_photo: "some cover_photo", description: "some description", is_published: true, photo: "some photo", published_at: ~N[2010-04-17 14:00:00.000000], slug: "some slug", subtitle: "some subtitle", title: "some title"}
  @update_attrs %{body: "some updated body", cover_photo: "some updated cover_photo", description: "some updated description", is_published: false, photo: "some updated photo", published_at: ~N[2011-05-18 15:01:01.000000], slug: "some updated slug", subtitle: "some updated subtitle", title: "some updated title"}
  @invalid_attrs %{body: nil, cover_photo: nil, description: nil, is_published: nil, photo: nil, published_at: nil, slug: nil, subtitle: nil, title: nil}

  def fixture(:post) do
    {:ok, post} = Blog.create_post(@create_attrs)
    post
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, v1_blog_post_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create post" do
    test "renders post when data is valid", %{conn: conn} do
      conn = post conn, v1_blog_post_path(conn, :create), post: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, v1_blog_post_path(conn, :show, id)
      assert post = json_response(conn, 200)["data"]
      assert post["id"] == id
      assert post["body"] == "some body"
      assert post["cover_photo"] == "some cover_photo"
      assert post["description"] == "some description"
      assert post["is_published"] == true
      assert post["photo"] == "some photo"
      # assert post["published_at"] == ~N[2010-04-17 14:00:00.000000]
      assert post["slug"] == "some slug"
      assert post["subtitle"] == "some subtitle"
      assert post["title"] == "some title"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, v1_blog_post_path(conn, :create), post: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update post" do
    setup [:create_post]

    test "renders post when data is valid", %{conn: conn, post: %Post{id: id} = post} do
      conn = put conn, v1_blog_post_path(conn, :update, post), post: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, v1_blog_post_path(conn, :show, id)
      assert post = json_response(conn, 200)["data"]
      assert post["id"] == id
      assert post["body"] == "some updated body"
      assert post["cover_photo"] == "some updated cover_photo"
      assert post["description"] == "some updated description"
      assert post["is_published"] == false
      assert post["photo"] == "some updated photo"
      # assert post["published_at"] == ~N[2011-05-18 15:01:01.000000]
      assert post["slug"] == "some updated slug"
      assert post["subtitle"] == "some updated subtitle"
      assert post["title"] == "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put conn, v1_blog_post_path(conn, :update, post), post: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete conn, v1_blog_post_path(conn, :delete, post)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, v1_blog_post_path(conn, :show, post)
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
