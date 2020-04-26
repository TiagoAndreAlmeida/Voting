defmodule Voting.Admin do
  @moduledoc """
  Admin module doc
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "administrators" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :email, :password_hash])
    |> validate_required([:name, :email, :password_hash])
  end
end
