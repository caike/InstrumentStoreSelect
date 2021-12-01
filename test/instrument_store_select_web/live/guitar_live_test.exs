defmodule InstrumentStoreSelectWeb.GuitarLiveTest do
  use InstrumentStoreSelectWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "Index" do
    test "lists all guitars", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.guitar_index_path(conn, :index))

      assert html =~ "Listing Guitars"
    end
  end
end
