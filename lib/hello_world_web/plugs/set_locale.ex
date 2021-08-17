defmodule HelloWorldWeb.Plugs.SetLocale do
  @moduledoc false
  import Plug.Conn

  @supported_locales Gettext.known_locales(HelloWorldWeb.Gettext)

  def init(_options), do: nil

  # def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _options)
  #     when locale in @supported_locales do
  #   Gettext |> Gettext.put_locale(locale)
  #   conn |> put_resp_cookie("locale", locale, max_age: 365 * 24 * 60 * 60)
  # end

  # def call(conn, _options), do: conn

  @spec call(atom | %{:params => nil | maybe_improper_list | map, optional(any) => any}, any) ::
          atom | %{:params => nil | maybe_improper_list | map, optional(any) => any}
  def call(conn, _options) do
    case fetch_locale_from(conn) do
      nil ->
        HelloWorldWeb.Gettext |> Gettext.put_locale("en")
        conn |> put_resp_cookie("locale", "en", max_age: 365 * 24 * 60 * 60)
        conn |> assign(:current_locale, "en")

      locale ->
        IO.puts "------------------- #{locale} ----------"
        HelloWorldWeb.Gettext |> Gettext.put_locale(locale)
        conn |> put_resp_cookie("locale", locale, max_age: 365 * 24 * 60 * 60)
        conn |> assign(:current_locale, locale)
    end
  end

  defp fetch_locale_from(conn) do
    (conn.params["locale"] || conn.cookies["locale"])
    |> check_locale
  end

  defp check_locale(locale) when locale in @supported_locales, do: locale
  defp check_locale(_), do: nil
end
