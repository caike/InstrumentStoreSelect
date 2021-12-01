defmodule InstrumentStoreSelect.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InstrumentStoreSelect.Inventory` context.
  """

  @doc """
  Generate a guitar.
  """
  def guitar_fixture(attrs \\ %{}) do
    {:ok, guitar} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        model: "some model",
        year: 42
      })
      |> InstrumentStoreSelect.Inventory.create_guitar()

    guitar
  end
end
