defmodule HelloWorld.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HelloWorld.Accounts` context.
  """

  import Ecto.Changeset
  alias HelloWorld.Accounts.User
  alias HelloWorld.Repo

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "banana123456789012"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> HelloWorld.Accounts.register_user()

    user
  end

  def confirm_account(user) do
    changeset = User.confirm_changeset(user)
    {:ok, user} = Repo.update(changeset)
    user
  end

  def extract_user_token(fun) do
    {:ok, captured} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token, _] = String.split(captured.body, "[TOKEN]")
    token
  end
end
