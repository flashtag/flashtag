# FlashtagAPI

To use your app's Router to forward the request to the Flashtag API Router:

Apply your own pipelines before forwarding. This is where you would add
things like auth.

```elixir
defmodule MyApp.Router do
  use MyApp, :router

  # ...

  pipeline :api do
    # API plugs
  end

  pipeline :api_auth do
    # API Auth plugs
  end

  # ...

  scope "/api" do
    pipe_through [:api, :api_auth]
    forward "/", FlashtagAPI.Plugs.Forward
  end
end
```