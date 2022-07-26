defmodule AptdecoTest do
  use Aptdeco.DataCase

  describe "product_list/1" do
    test "returns structs from JSON" do
      sample_struct = %Aptdeco.Product{
        image_path: "https://picsum.photos/600",
        is_set: false,
        price: 85.0,
        qty: 2,
        region: "NY, NJ, PA & CT",
        retail_price: 395.0,
        set_qty: "undefined",
        title: "Vitra Eames Molded Plastic Chair (White)"
      }

      number_of_records = 5

      product_list = Aptdeco.product_list()
      assert Enum.count(product_list) == number_of_records
      assert Enum.find(product_list, fn record -> record == sample_struct end)
    end

    def json_fixture do
      """
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
    end
  end
end
