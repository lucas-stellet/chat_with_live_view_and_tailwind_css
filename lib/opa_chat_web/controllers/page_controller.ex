defmodule OpaChatWeb.PageController do
  use OpaChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
