defmodule Rumbl.User do
  use RumblWeb, :model

  @fields [:name, :username]

  schema "users" do
    field :name, :string
    field :username, :string
    # field :password, :string, virtual: true
    # field :password_hash, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_length(:username, min: 1, max: 20)
  end
end
