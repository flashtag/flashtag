defmodule Flashtag.Factory do
  use ExMachina.Ecto, repo: Flashtag.Repo

  use Flashtag.Accounts.UserFactory

  use Flashtag.Blog.CategoryFactory
  use Flashtag.Blog.PostFactory
  use Flashtag.Blog.SeriesFactory
  use Flashtag.Blog.TagFactory
end
