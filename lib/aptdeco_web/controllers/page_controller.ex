defmodule AptdecoWeb.PageController do
  use AptdecoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
