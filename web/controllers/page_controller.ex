defmodule Creepcamp.PageController do
  use Creepcamp.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
