defmodule InstrumentStoreSelectWeb.GuitarLive.Index do
  use InstrumentStoreSelectWeb, :live_view

  alias InstrumentStoreSelect.Inventory

  @impl true
  def mount(_params, _session, socket) do
    brands = Inventory.list_unique_brands()

    {:ok,
     socket
     |> assign(:guitars, [])
     |> assign(:models, [])
     |> assign(:selected_brand, nil)
     |> assign(:brands, brands)}
  end

  @impl true
  def handle_event("set-filter", %{"_target" => ["brand"], "brand" => brand}, socket) do
    {:noreply,
     socket
     |> assign(:models, Inventory.filter_models_by_brand(brand))
     |> assign(:selected_brand, brand)}
  end

  @impl true
  def handle_event("set-filter", %{"_target" => ["model"], "model" => model}, socket) do
    selected_brand = socket.assigns.selected_brand
    guitars = Inventory.filter_by_brand_and_model(selected_brand, model)
    {:noreply, assign(socket, :guitars, guitars)}
  end
end
