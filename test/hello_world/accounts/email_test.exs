defmodule HelloWorld.Accounts.EmailTest do
  use ExUnit.Case

  alias HelloWorld.Accounts.Email

  test "welcome email" do
    to_email = "ralph@example.com"
    email = Email.welcome_email(to_email)

    assert email.to == to_email
    assert email.from == "support@myapp.com"
    assert email.html_body =~ "<strong>Thanks for joining!</strong>"
    assert email.text_body =~ "Thanks for joining"
  end
end
