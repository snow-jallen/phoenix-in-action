defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "My First Item",
      description: "A tasy item sure to please",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "Ben Hur",
      description: "Classic.  Totally awesome.  Don't even talk to me about the movie.",
      ends_at: ~N[2020-02-02 02:02:02]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn(item) -> item.id === id end)
  end

  def get_by(Item, map) do
    Enum.find(@items, fn(item) ->
      Enum.all?(Map.keys(map), fn(key) ->
        Map.get(item, key) === map[key]
      end)
    end)
  end
end
