defmodule WerdleWeb.WordLiveTest do
  use WerdleWeb.ConnCase

  import Phoenix.LiveViewTest
  import Werdle.WordBankFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_word(_) do
    word = word_fixture()
    %{word: word}
  end

  describe "Index" do
    setup [:create_word]

    test "lists all words", %{conn: conn, word: word} do
      {:ok, _index_live, html} = live(conn, ~p"/words")

      assert html =~ "Listing Words"
      assert html =~ word.name
    end

    test "saves new word", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/words")

      assert index_live |> element("a", "New Word") |> render_click() =~
               "New Word"

      assert_patch(index_live, ~p"/words/new")

      assert index_live
             |> form("#word-form", word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#word-form", word: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/words")

      html = render(index_live)
      assert html =~ "Word created successfully"
      assert html =~ "some name"
    end

    test "updates word in listing", %{conn: conn, word: word} do
      {:ok, index_live, _html} = live(conn, ~p"/words")

      assert index_live |> element("#words-#{word.id} a", "Edit") |> render_click() =~
               "Edit Word"

      assert_patch(index_live, ~p"/words/#{word}/edit")

      assert index_live
             |> form("#word-form", word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#word-form", word: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/words")

      html = render(index_live)
      assert html =~ "Word updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes word in listing", %{conn: conn, word: word} do
      {:ok, index_live, _html} = live(conn, ~p"/words")

      assert index_live |> element("#words-#{word.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#words-#{word.id}")
    end
  end

  describe "Show" do
    setup [:create_word]

    test "displays word", %{conn: conn, word: word} do
      {:ok, _show_live, html} = live(conn, ~p"/words/#{word}")

      assert html =~ "Show Word"
      assert html =~ word.name
    end

    test "updates word within modal", %{conn: conn, word: word} do
      {:ok, show_live, _html} = live(conn, ~p"/words/#{word}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Word"

      assert_patch(show_live, ~p"/words/#{word}/show/edit")

      assert show_live
             |> form("#word-form", word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#word-form", word: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/words/#{word}")

      html = render(show_live)
      assert html =~ "Word updated successfully"
      assert html =~ "some updated name"
    end
  end
end
