defmodule FlashtagWeb.Router do
  use FlashtagWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FlashtagWeb do
    pipe_through [:browser]
    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through []
    forward "/", FlashtagAPI.Router
  end
end
