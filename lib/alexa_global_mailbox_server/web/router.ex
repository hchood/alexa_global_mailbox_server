defmodule AlexaGlobalMailboxServer.Web.Router do
  use AlexaGlobalMailboxServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AlexaGlobalMailboxServer.Web do
    pipe_through :api

    post "/alexa", AlexaController, :post
  end
end
