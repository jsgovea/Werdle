defmodule WerdleWeb.GameBoard.CellComponent do
  use WerdleWeb, :live_component

  @impl true
  def update(
    %{id: id, cell_backgrounds: cell_backgrounds, changeset: changeset},
    socket
  ) do
    socket =
    socket
    |> assign(:id, id)
    |> assign(:cell_backgrounds, cell_backgrounds)
    |> assign(:changeset, changeset)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="relative sm:w-16 sm:h-16 h-14 w-14 col-span-1 pointer-events-none select-none">
      <input
        id={@id}
        type="text"
         value=""
        class={"w-full h-full p-3 text-slate-500 rounded-sm text-2xl text-center font-bold cursor-default"}
        maxlength="1" />
    </div>
    """
  end
end
