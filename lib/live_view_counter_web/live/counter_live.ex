defmodule LiveViewCounterWeb.CounterLive do
  use Phoenix.LiveView
  alias LiveViewCounterWeb.CounterView

  # The render function renders the actual DOM element.
  def render(assigns) do
    CounterView.render("index.html", assigns)
  end

  # This function is called when the live view is rendered from the controller.
  # It receives session data and the LiveView socket we created.
  # render get's called once mount is complete
  def mount(_session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end
end
