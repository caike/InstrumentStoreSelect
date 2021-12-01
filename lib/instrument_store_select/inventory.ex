defmodule InstrumentStoreSelect.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias InstrumentStoreSelect.Repo

  alias InstrumentStoreSelect.Inventory.Guitar

  def list_unique_brands do
    from(g in Guitar, group_by: g.brand, select: g.brand)
    |> Repo.all()
  end

  def filter_models_by_brand(brand) do
    from(g in Guitar, where: g.brand == ^brand, group_by: g.model, select: g.model)
    |> Repo.all()
  end

  def filter_by_brand_and_model(brand, model) do
    from(g in Guitar,
      where: g.brand == ^brand,
      where: g.model == ^model
    )
    |> Repo.all()
  end

  @doc """
  Returns the list of guitars.

  ## Examples

      iex> list_guitars()
      [%Guitar{}, ...]

  """
  def list_guitars do
    Repo.all(Guitar)
  end

  @doc """
  Creates a guitar.

  ## Examples

      iex> create_guitar(%{field: value})
      {:ok, %Guitar{}}

      iex> create_guitar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guitar(attrs \\ %{}) do
    %Guitar{}
    |> Guitar.changeset(attrs)
    |> Repo.insert()
  end
end
