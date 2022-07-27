defmodule Aptdeco do
  @moduledoc """
  The Aptdeco module
  """
  @json_data """
    [{
    "title": "Vitra Eames Molded Plastic Chair (White)",
    "price": 85.00,
    "retailPrice": 395.00,
    "qty": 2,
    "isSet": false,
    "setQty": "undefined",
    "imagePath": "https://picsum.photos/600",
    "region": "NY, NJ, PA & CT"
    },{
    "title": "Mid Century Modern White Dining Chair Set of 2",
    "price": 259.00,
    "retailPrice": "undefined",
    "qty": 2,
    "isSet": true,
    "setQty": 2,
    "imagePath": "https://picsum.photos/600",
    "region": "NY, NJ, PA & CT"
    },{
    "title": "Modern Brown Faux Leather Dining Chair Set of 4",
    "price": 399.00,
    "retailPrice": "undefined",
    "qty": 4,
    "isSet": true,
    "setQty": 4,
    "imagePath": "https://picsum.photos/300/600",
    "region": "NY, NJ, PA & CT"
    },{
    "title": "Original Iberia Airlines Galley Cart",
    "price": 350.00,
    "retailPrice": 600.00,
    "qty": 1,
    "isSet": false,
    "setQty": "undefined",
    "imagePath": "https://picsum.photos/600/300",
    "region": "NY, NJ, PA & CT"
    },{
    "title": "Wooden Dresser with Mirror",
    "price": 250.00,
    "retailPrice": 1000.00,
    "qty": 1,
    "isSet": false,
    "setQty": "undefined",
    "imagePath": "https://picsum.photos/300/600",
    "region": "SF Bay Area"
    }]
  """

  def product_list(json \\ @json_data) do
    json
    |> Jason.decode!(keys: :atoms)
    |> Enum.map(fn product_params ->
      Aptdeco.Product.from_params(product_params)
    end)
  end

  def paginated_product_list(page, number) do
    number
    |> magnified_list()
    |> Scrivener.paginate(page: page, page_size: 4)
  end

  # Fetches the product_list enough times to fill the page.
  def magnified_list("10"), do: loop_call(2)
  def magnified_list("25"), do: loop_call(5)
  def magnified_list("50"), do: loop_call(10)
  def magnified_list("100"), do: loop_call(20)

  defp loop_call(times),
    do: Enum.reduce(1..times, [], fn _num, acc -> acc ++ product_list() end)
end
