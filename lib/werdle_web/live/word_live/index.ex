defmodule WerdleWeb.WordLive.Index do
  use WerdleWeb, :live_view

  alias Werdle.WordBank
  alias Werdle.WordBank.Word

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :words, WordBank.list_words())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Word")
    |> assign(:word, WordBank.get_word!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Word")
    |> assign(:word, %Word{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Words")
    |> assign(:word, nil)
  end

  @impl true
  def handle_info({WerdleWeb.WordLive.FormComponent, {:saved, word}}, socket) do
    {:noreply, stream_insert(socket, :words, word)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    word = WordBank.get_word!(id)
    {:ok, _} = WordBank.delete_word(word)

    {:noreply, stream_delete(socket, :words, word)}
  end
end
