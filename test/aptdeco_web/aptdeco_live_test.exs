defmodule AptdecoWeb.AptdecoLiveTest do
  use AptdecoWeb.ConnCase

  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  describe "rendering the product list" do
    test "mounts with a default of 10 products", %{conn: conn} do
      label_for_third_row_of_four_products = "row-number-3"
      conn = get(conn, "/")

      {:ok, _view, html} = live(conn)

      assert html =~ ~s(select id="number_of_products_number")
      assert html =~ label_for_third_row_of_four_products
    end

    test "allows user to select rendering more items", %{conn: conn} do
      twenty_fifth_row_of_four_products = "row-number-25"
      conn = get(conn, "/")

      {:ok, view, _html} = live(conn)

      updated_page =
        render_change(view, :change_number_of_products, %{
          "number_of_products" => %{"number" => "100"}
        })

      assert updated_page =~ twenty_fifth_row_of_four_products
    end
  end
end
