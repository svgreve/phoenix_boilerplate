defmodule HelloWorld.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :hello_world,
    adapter: Ecto.Adapters.Postgres
end
