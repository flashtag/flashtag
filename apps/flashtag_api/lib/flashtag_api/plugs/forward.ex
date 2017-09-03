defmodule FlashtagAPI.Plugs.Forward do
  @moduledoc """
  Use in your app's Router to forward the request to the Flashtag API Router.

  The forwarder fixes the path since the forwarding router strips the matching
  path before forwarding.

  Apply your own pipelines before forwarding. This is where you would add
  things like auth.

  ## Example

      pipeline :api do
        # API plugs
      end

      pipeline :api_auth do
        # API Auth plugs
      end

      scope "/api" do
        pipe_through [:api, :api_auth]
        forward "/", FlashtagAPI.Plugs.Forward
      end

  """

  @doc false
  def init(default), do: default

  @doc false
  def call(conn, opts) do
    conn
    |> fix_path()
    |> FlashtagAPI.Router.call(opts)
  end

  defp fix_path(%{path_info: ["api" | _]} = conn), do: conn
  defp fix_path(%{path_info: path_info} = conn) do
    %{conn | path_info: ["api" | path_info], script_name: []}
  end
end
