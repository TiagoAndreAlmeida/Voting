defmodule Voting.CreateAdminTest do
  use Voting.DataCase, async: true
  alias Voting.{Admin, CreateAdmin}

  descibe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "Test", email: "test@email.com", password: "123456"}
      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "Test"
      assert admin.email == "test@email.com"
      assert admin.password_hash != "123456"
    end

    test "return error when name is missing" do
      params = %{name: "", email: "test@email.com", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can`t be blank"]} = errors_on(changeset)
    end

    test "return error when email is missing" do
      params = %{name: "Test", email: "", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can`t be blank"]} = errors_on(changeset)
    end

    test "return error when password is missing" do
      params = %{name: "Test", email: "test@email.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can`t be blank"]} = errors_on(changeset)
    end
  end
end
