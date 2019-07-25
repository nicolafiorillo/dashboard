defmodule Dashboard.LiveUpdates do
  @topic inspect(__MODULE__)

  @spec subscribe :: :ok | {:error, any}
  def subscribe() do
    Phoenix.PubSub.subscribe(Dashboard.PubSub, @topic, link: true)
  end

  @spec notify(any) :: :ok
  def notify(info) do
    Phoenix.PubSub.broadcast!(Dashboard.PubSub, @topic, {:change, info})
  end
end
