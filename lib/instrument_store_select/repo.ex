defmodule InstrumentStoreSelect.Repo do
  use Ecto.Repo,
    otp_app: :instrument_store_select,
    adapter: Ecto.Adapters.Postgres
end
