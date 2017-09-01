defmodule FlashtagAPI.Router do
  use FlashtagAPI, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FlashtagAPI do
    pipe_through :api
  end
end
