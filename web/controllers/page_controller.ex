defmodule Gcommerce.PageController do
  use Gcommerce.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
