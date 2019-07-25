defmodule DashboardWeb.Info do
  use Phoenix.LiveView

  def mount(_session, socket) do
    Dashboard.LiveUpdates.subscribe()
    {:ok, fetch(socket, "testa")}
  end

  @spec render(any) :: any
  def render(assigns), do: DashboardWeb.InfoView.render("info.html", assigns)

  @spec handle_call({:change, any}, any, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_call({:change, info}, _from, socket), do: {:noreply, fetch(socket, info)}

  @spec handle_info({:change, any}, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_info({:change, info}, socket) do
    {:noreply, fetch(socket, info)}
  end

  defp fetch(socket, info), do: assign(socket, info: info)
end
