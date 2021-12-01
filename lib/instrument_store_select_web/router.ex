defmodule InstrumentStoreSelectWeb.Router do
  use InstrumentStoreSelectWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {InstrumentStoreSelectWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", InstrumentStoreSelectWeb do
    pipe_through(:browser)

    live("/", GuitarLive.Index, :index)
  end
end
