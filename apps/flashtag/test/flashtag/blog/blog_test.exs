defmodule Flashtag.BlogTest do
  use Flashtag.DataCase

  alias Flashtag.Blog

  describe "posts" do
    alias Flashtag.Blog.Post

    @valid_attrs %{body: "some body", cover_photo: "some cover_photo", description: "some description", is_published: true, photo: "some photo", published_at: ~N[2010-04-17 14:00:00.000000], slug: "some slug", subtitle: "some subtitle", title: "some title"}
    @update_attrs %{body: "some updated body", cover_photo: "some updated cover_photo", description: "some updated description", is_published: false, photo: "some updated photo", published_at: ~N[2011-05-18 15:01:01.000000], slug: "some updated slug", subtitle: "some updated subtitle", title: "some updated title"}
    @invalid_attrs %{body: nil, cover_photo: nil, description: nil, is_published: nil, photo: nil, published_at: nil, slug: nil, subtitle: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Blog.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.cover_photo == "some cover_photo"
      assert post.description == "some description"
      assert post.is_published == true
      assert post.photo == "some photo"
      assert post.published_at == ~N[2010-04-17 14:00:00.000000]
      assert post.slug == "some slug"
      assert post.subtitle == "some subtitle"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Blog.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.body == "some updated body"
      assert post.cover_photo == "some updated cover_photo"
      assert post.description == "some updated description"
      assert post.is_published == false
      assert post.photo == "some updated photo"
      assert post.published_at == ~N[2011-05-18 15:01:01.000000]
      assert post.slug == "some updated slug"
      assert post.subtitle == "some updated subtitle"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end

  describe "categories" do
    alias Flashtag.Blog.Category

    @valid_attrs %{description: "some description", name: "some name", slug: "some slug"}
    @update_attrs %{description: "some updated description", name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{description: nil, name: nil, slug: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Blog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Blog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Blog.create_category(@valid_attrs)
      assert category.description == "some description"
      assert category.name == "some name"
      assert category.slug == "some slug"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Blog.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.description == "some updated description"
      assert category.name == "some updated name"
      assert category.slug == "some updated slug"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_category(category, @invalid_attrs)
      assert category == Blog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Blog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Blog.change_category(category)
    end
  end

  describe "series" do
    alias Flashtag.Blog.Series

    @valid_attrs %{description: "some description", name: "some name", slug: "some slug"}
    @update_attrs %{description: "some updated description", name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{description: nil, name: nil, slug: nil}

    def series_fixture(attrs \\ %{}) do
      {:ok, series} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_series()

      series
    end

    test "list_series/0 returns all series" do
      series = series_fixture()
      assert Blog.list_series() == [series]
    end

    test "get_series!/1 returns the series with given id" do
      series = series_fixture()
      assert Blog.get_series!(series.id) == series
    end

    test "create_series/1 with valid data creates a series" do
      assert {:ok, %Series{} = series} = Blog.create_series(@valid_attrs)
      assert series.description == "some description"
      assert series.name == "some name"
      assert series.slug == "some slug"
    end

    test "create_series/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_series(@invalid_attrs)
    end

    test "update_series/2 with valid data updates the series" do
      series = series_fixture()
      assert {:ok, series} = Blog.update_series(series, @update_attrs)
      assert %Series{} = series
      assert series.description == "some updated description"
      assert series.name == "some updated name"
      assert series.slug == "some updated slug"
    end

    test "update_series/2 with invalid data returns error changeset" do
      series = series_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_series(series, @invalid_attrs)
      assert series == Blog.get_series!(series.id)
    end

    test "delete_series/1 deletes the series" do
      series = series_fixture()
      assert {:ok, %Series{}} = Blog.delete_series(series)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_series!(series.id) end
    end

    test "change_series/1 returns a series changeset" do
      series = series_fixture()
      assert %Ecto.Changeset{} = Blog.change_series(series)
    end
  end

  describe "tags" do
    alias Flashtag.Blog.Tag

    @valid_attrs %{description: "some description", name: "some name", slug: "some slug"}
    @update_attrs %{description: "some updated description", name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{description: nil, name: nil, slug: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Blog.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Blog.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Blog.create_tag(@valid_attrs)
      assert tag.description == "some description"
      assert tag.name == "some name"
      assert tag.slug == "some slug"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, tag} = Blog.update_tag(tag, @update_attrs)
      assert %Tag{} = tag
      assert tag.description == "some updated description"
      assert tag.name == "some updated name"
      assert tag.slug == "some updated slug"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_tag(tag, @invalid_attrs)
      assert tag == Blog.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Blog.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Blog.change_tag(tag)
    end
  end
end
