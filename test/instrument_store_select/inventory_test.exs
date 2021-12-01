defmodule InstrumentStoreSelect.InventoryTest do
  use InstrumentStoreSelect.DataCase

  alias InstrumentStoreSelect.Inventory

  describe "guitars" do
    import InstrumentStoreSelect.InventoryFixtures

    setup do
      {:ok,
       %{
         guitars: [
           guitar_fixture(brand: "Gibson", model: "SG"),
           guitar_fixture(brand: "Gibson", model: "LP"),
           guitar_fixture(brand: "Fender")
         ]
       }}
    end

    test "list_guitars/0 returns all guitars", %{guitars: guitars} do
      assert Inventory.list_guitars() == guitars
    end

    test "list_unique_brands/0 returns all brands" do
      brands = Inventory.list_unique_brands()
      assert ["Fender", "Gibson"] == Enum.sort(brands)
    end

    test "filter_by_brand/1 returns results by brand" do
      result = Inventory.filter_models_by_brand("Gibson")
      assert ["LP", "SG"] == Enum.sort(result)
    end

    test "filter_by_brand_and_model/2 returns filtered results" do
      guitar = Inventory.filter_by_brand_and_model("Gibson", "LP")
      assert length(guitar) == 1
      assert [%{brand: "Gibson", model: "LP"}] = guitar
    end
  end
end
