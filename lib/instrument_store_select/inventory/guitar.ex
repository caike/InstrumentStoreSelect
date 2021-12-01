defmodule InstrumentStoreSelect.Inventory.Guitar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guitars" do
    field :brand, :string
    field :model, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(guitar, attrs) do
    guitar
    |> cast(attrs, [:brand, :model, :year])
    |> validate_required([:brand, :model, :year])
  end
end
