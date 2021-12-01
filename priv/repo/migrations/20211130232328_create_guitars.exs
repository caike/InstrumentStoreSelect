defmodule InstrumentStoreSelect.Repo.Migrations.CreateGuitars do
  use Ecto.Migration

  def change do
    create table(:guitars) do
      add :brand, :string
      add :model, :string
      add :year, :integer

      timestamps()
    end
  end
end
