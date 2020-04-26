defmodule Voting.SignInAdminTest do
  use Voting.DataCase, async: true

  import Voting.Factory

  alias Voting.{Admin, SignInAdmin}

  describe "run/2" do
    setup do
      insert(:admin)
      :ok
    end

    test "returns ok when email and password match" do
      assert {:ok, %Admin{}} = SignInAdmin.run("email@exemplo.com", "123456")
    end

    test "returns error when there is not admin with this email" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("email@exemplo.om", "123456")
    end

    test "returns error when there is not admin with this password" do
      assert {:error, :email_or_password_invalid} =
               SignInAdmin.run("email@exemplo.com", "12345678")
    end
  end
end
