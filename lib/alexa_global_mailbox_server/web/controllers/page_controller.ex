defmodule AlexaGlobalMailboxServer.Web.PageController do
  use AlexaGlobalMailboxServer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
