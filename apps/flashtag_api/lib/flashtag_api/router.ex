defmodule FlashtagAPI.Router do
  use FlashtagAPI, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1/", FlashtagAPI.V1, as: :v1 do
    pipe_through [:api]

    scope "/accounts", as: :accounts do
      resources "/users", Accounts.UserController
    end

    scope "/blog", as: :blog do
      resources "/series", Blog.SeriesController
      resources "/categories", Blog.CategoryController
      resources "/tags", Blog.TagController
      resources "/posts", Blog.PostController
    end
  end
end
