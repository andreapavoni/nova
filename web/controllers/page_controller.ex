defmodule Nova.PageController do
  use Nova.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
