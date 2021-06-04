defmodule HelloWorld.Accounts.HourlyWorker do
  @moduledoc false
  use Oban.Worker, queue: :default

  alias HelloWorld.Accounts
  alias HelloWorld.Repo

  @impl Oban.Worker

  def perform(_args) do
    q = Accounts.query_accounts_not_confirmed_in_two_hours()
    Repo.delete_all(q)

    :ok
  end
end
