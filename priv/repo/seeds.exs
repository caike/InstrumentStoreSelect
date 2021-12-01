[
  %{
    brand: "Gibson",
    model: "SG",
    year: 19999
  },
  %{
    brand: "Gibson",
    model: "Les Paul",
    year: 2020
  },
  %{
    brand: "Fender",
    model: "Stratocaster",
    year: 1980
  },
  %{
    brand: "Fender",
    model: "Telecaster",
    year: 1999
  },
  %{
    brand: "Fender",
    model: "Telecaster",
    year: 1989
  }
]
|> Enum.map(&InstrumentStoreSelect.Inventory.create_guitar(&1))
