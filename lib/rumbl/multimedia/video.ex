defmodule Rumbl.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:url, :title, :description]
  @optional_fields []

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    # field :user_id, :id
    belongs_to :user, Rumbl.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
