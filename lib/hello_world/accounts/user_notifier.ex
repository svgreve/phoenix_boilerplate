defmodule HelloWorld.Accounts.UserNotifier do
  @moduledoc false

  alias HelloWorld.Accounts.Email
  alias HelloWorld.Mailer

  # defp deliver(to, body) do
  #   require Logger
  #   Logger.debug(body)
  #   {:ok, %{to: to, body: body}}
  # end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    Email.registration_email_confirmation(user.email, url)
    |> Mailer.deliver_later!()

    {:ok, %{to: user.email}}
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    Email.reset_password_instructions(user.email, url)
    |> Mailer.deliver_later!()

    {:ok, %{to: user.email}}
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    Email.update_email_instructions(user.email, url)
    |> Mailer.deliver_later!()

    {:ok, %{to: user.email}}
  end
end
