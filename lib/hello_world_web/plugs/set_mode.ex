defmodule HelloWorldWeb.Plugs.SetMode do
  @moduledoc false
  import Plug.Conn

  @supported_modes ["light", "dark"]

  def init(_options), do: nil

  def call(conn, _options) do
    case fetch_mode_from(conn) do
      nil ->
        conn |> put_resp_cookie("mode", "light", max_age: 365 * 24 * 60 * 60)
        conn |> assign(:current_mode, "light")

      mode ->
        IO.puts("------------------ #{mode}")
        conn |> put_resp_cookie("mode", mode, max_age: 365 * 24 * 60 * 60)
        conn |> assign(:current_mode, mode)
    end
  end

  defp fetch_mode_from(conn) do
    (conn.params["mode"] || conn.cookies["mode"])
    |> check_mode
  end

  defp check_mode(mode) when mode in @supported_modes, do: mode
  defp check_mode(_), do: nil
end
