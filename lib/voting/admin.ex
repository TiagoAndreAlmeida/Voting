defmodule Voting.Admin do
  @moduledoc """
  Admin module doc
  """
  use Ecto.Schema

  schema "administrators" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end
end
