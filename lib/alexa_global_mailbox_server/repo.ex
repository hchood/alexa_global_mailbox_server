defmodule AlexaGlobalMailboxServer.Repo do
  use Ecto.Repo, otp_app: :alexa_global_mailbox_server

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
