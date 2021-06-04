defmodule HelloWorldWeb.HomeController do
  @moduledoc false

  use HelloWorldWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
