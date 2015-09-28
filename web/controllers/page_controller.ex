defmodule Nova.PageController do
  @moduledoc false
  use Nova.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
