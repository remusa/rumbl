defmodule Rumbl.Multimedia.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @required_fields [:name]

  schema "categories" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

  def alphabetical(query) do
    from c in query,
      order_by: c.name
  end

  def names_and_ids(query) do
    from c in query,
      select: {c.name, c.id}
  end
end
