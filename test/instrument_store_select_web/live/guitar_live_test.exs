defmodule InstrumentStoreSelectWeb.GuitarLiveTest do
  use InstrumentStoreSelectWeb.ConnCase

  import Phoenix.LiveViewTest
  import InstrumentStoreSelect.InventoryFixtures

  describe "Index" do
    setup do
      {:ok,
       %{
         guitars: [
           guitar_fixture(brand: "Gibson", model: "SG", year: 1500),
           guitar_fixture(brand: "Gibson", model: "LP", year: 1989),
           guitar_fixture(brand: "Gibson", model: "LP", year: 2020),
           guitar_fixture(brand: "Fender", model: "Stratocaster", year: 1600)
         ]
       }}
    end

    test "lists all guitars", %{conn: conn} do
      {:ok, view, html} = live(conn, Routes.guitar_index_path(conn, :index))

      assert html =~ "Listing Guitars"

      refute has_element?(view, "form > select#model option[value=SG]")
      refute has_element?(view, "form > select#model option[value=LP]")
      refute has_element?(view, "form > select#model option[value=Stratocaster]")
    end

    test "filter by brand", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.guitar_index_path(conn, :index))

      view
      |> element("form")
      |> render_change(%{"_target" => ["brand"], "brand" => "Gibson"})

      assert has_element?(view, "form > select#model option[value=SG]")
      assert has_element?(view, "form > select#model option[value=LP]")

      {:ok, view, _html} = live(conn, Routes.guitar_index_path(conn, :index))

      view
      |> element("form")
      |> render_change(%{"_target" => ["brand"], "brand" => "Fender"})

      assert has_element?(
               view,
               "form > select#model option[value=Stratocaster]"
             )
    end

    test "filter by model", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.guitar_index_path(conn, :index))

      view
      |> element("form")
      |> render_change(%{"_target" => ["brand"], "brand" => "Gibson"})

      assert has_element?(view, "form > select#model option[value=LP]")
      assert has_element?(view, "form > select#model option[value=SG]")

      html =
        view
        |> element("form")
        |> render_change(%{"_target" => ["model"], "model" => "LP"})

      assert html =~ "1989"
      assert html =~ "2020"

      refute html =~ "1500"
      refute html =~ "1600"
    end
  end
end
