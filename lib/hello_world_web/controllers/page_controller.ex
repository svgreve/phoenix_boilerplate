defmodule HelloWorldWeb.PageController do
  @moduledoc false
  use HelloWorldWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_cookie("locale", conn.assigns.current_locale, max_age: 365 * 24 * 60 * 60)
    |> render("index.html")
  end
end
