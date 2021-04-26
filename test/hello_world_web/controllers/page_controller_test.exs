defmodule HelloWorldWeb.PageControllerTest do
  use HelloWorldWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /?locale=en", %{conn: conn} do
    conn = get(conn, "/?locale=en")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /?locale=pt_BR", %{conn: conn} do
    conn = get(conn, "/?locale=pt_BR")
    assert html_response(conn, 200) =~ "Bem-vindo ao Phoenix!"
  end
end
