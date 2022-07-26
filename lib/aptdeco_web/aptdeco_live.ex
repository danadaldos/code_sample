defmodule AptdecoWeb.AptdecoLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :products, Aptdeco.product_list())}
  end

  def render do
  end

  defp product_card(assigns) do
    ~H"""
    <td>
      <img src={@product.image_path} />
      <p><%= @product.region %></p>
      <p><%= @product.title %></p>
      <p><%= @product.price %> • Qty: <%= @product.qty %></p>
      <%= if @product.retail_price do %>
        <p>Est. retail <%= @product.retail_price %></p>
      <% end %>
      <%= if @product.is_set do %>
        <p><%= @product.set_qty%></p>
      <% end %>
    </td>
    """
  end
end
