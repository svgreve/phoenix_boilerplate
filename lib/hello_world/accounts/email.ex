defmodule HelloWorld.Accounts.Email do
  @moduledoc false
  import Bamboo.Email
  import HelloWorldWeb.Gettext
  use Bamboo.Phoenix, view: HelloWorldWeb.EmailView

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
    base_email()
    |> to(email)
    |> subject(gettext("Confirm your account"))
    |> assign(:email, email)
    |> assign(:url, url)
    |> render("registration_email_confirmation.html")
    |> premail()
  end

  def reset_password_instructions(email, url) do
    base_email()
    |> to(email)
    |> subject(gettext("Reset your password"))
    |> assign(:email, email)
    |> assign(:url, url)
    |> render("reset_password_instructions.html")
    |> premail()
  end

  def update_email_instructions(email, url) do
    base_email()
    |> to(email)
    |> subject(gettext("Confirm your new email"))
    |> assign(:email, email)
    |> assign(:url, url)
    |> render("update_email_instructions.html")
    |> premail()
  end

  defp base_email do
    new_email()
    |> from({"Docvs Accounts", "accounts@mail.docvs.net"})
    |> put_header("Reply-To", "postmaster@mail.docvs.net")
    |> put_html_layout({HelloWorldWeb.LayoutView, "email.html"})
    |> put_text_layout(false)
  end

  defp premail(email) do
    html = Premailex.to_inline_css(email.html_body)
    text = Premailex.to_text(email.html_body)

    email
    |> html_body(html)
    |> text_body(text)
  end
end
