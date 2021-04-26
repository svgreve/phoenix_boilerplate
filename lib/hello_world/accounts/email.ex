defmodule HelloWorld.Accounts.Email do
  @moduledoc false
  import Bamboo.Email

  alias HelloWorld.Accounts.User

  def welcome_email(email) do
    new_email(
      to: email,
      from: "support@myapp.com",
      subject: "Welcome to the app.",
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )
  end

  def test_email do
    new_email(
      to: "svgreve@gmail.com",
      from: "mail@mail.docvs.net",
      subject: "Welcome to the app.",
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )
  end

  def registration_email_confirmation(email, url) do
    html_body =
      "<h1>Hi #{email},</h1>" <>
        "<p>You can confirm your account by visiting the URL below:<p>" <>
        "<p>#{url}</p>" <>
        "<p>If you didn't create an account with us, please ignore this.</p>"

    new_email(
      to: email,
      from: "sender@email.docvs.net",
      subject: "Welcome to the app.",
      html_body: html_body,
      text_body: "Thanks for joining!"
    )
  end
end
