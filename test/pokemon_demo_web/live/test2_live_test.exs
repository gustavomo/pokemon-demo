defmodule PokemonDemoWeb.Test2LiveTest do
  use PokemonDemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import PokemonDemo.Rest1Fixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_test2(_) do
    test2 = test2_fixture()
    %{test2: test2}
  end

  describe "Index" do
    setup [:create_test2]

    test "lists all tests", %{conn: conn, test2: test2} do
      {:ok, _index_live, html} = live(conn, ~p"/tests")

      assert html =~ "Listing Tests"
      assert html =~ test2.name
    end

    test "saves new test2", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tests")

      assert index_live |> element("a", "New Test2") |> render_click() =~
               "New Test2"

      assert_patch(index_live, ~p"/tests/new")

      assert index_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#test2-form", test2: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tests")

      html = render(index_live)
      assert html =~ "Test2 created successfully"
      assert html =~ "some name"
    end

    test "updates test2 in listing", %{conn: conn, test2: test2} do
      {:ok, index_live, _html} = live(conn, ~p"/tests")

      assert index_live |> element("#tests-#{test2.id} a", "Edit") |> render_click() =~
               "Edit Test2"

      assert_patch(index_live, ~p"/tests/#{test2}/edit")

      assert index_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#test2-form", test2: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tests")

      html = render(index_live)
      assert html =~ "Test2 updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes test2 in listing", %{conn: conn, test2: test2} do
      {:ok, index_live, _html} = live(conn, ~p"/tests")

      assert index_live |> element("#tests-#{test2.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tests-#{test2.id}")
    end
  end

  describe "Show" do
    setup [:create_test2]

    test "displays test2", %{conn: conn, test2: test2} do
      {:ok, _show_live, html} = live(conn, ~p"/tests/#{test2}")

      assert html =~ "Show Test2"
      assert html =~ test2.name
    end

    test "updates test2 within modal", %{conn: conn, test2: test2} do
      {:ok, show_live, _html} = live(conn, ~p"/tests/#{test2}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Test2"

      assert_patch(show_live, ~p"/tests/#{test2}/show/edit")

      assert show_live
             |> form("#test2-form", test2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#test2-form", test2: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tests/#{test2}")

      html = render(show_live)
      assert html =~ "Test2 updated successfully"
      assert html =~ "some updated name"
    end
  end
end
