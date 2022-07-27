defmodule AptdecoWeb.AptdecoLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  @default_number_of_products "10"
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :rows, get_rows(@default_number_of_products))}
  end

  def render do
  end

  defp product_card(assigns) do
    ~H"""
    <td>
      <img src={@product.image_path} />
      <p><%= @product.region %></p>
      <p><%= @product.title %></p>
      <p><%= @product.price %> • Qty: <%= @product.qty %><%= if @product.is_set do %> • Set of <%= @product.set_qty %><% end %></p>
      <%= if @product.retail_price do %>
        <p>Est. retail <%= @product.retail_price %></p>
      <% end %>
    </td>
    """
  end

  def handle_event(
        "change_number_of_products",
        %{"number_of_products" => %{"number" => number}},
        socket
      ) do
    {:noreply, assign(socket, :rows, get_rows(number))}
  end

  defp get_rows(number_of_products) do
    list = Aptdeco.paginated_product_list(1, number_of_products)

    total_rows = list.total_pages

    Enum.map(1..total_rows, fn row_number ->
      {row_number, Aptdeco.paginated_product_list(row_number, number_of_products)}
    end)
  end
end
