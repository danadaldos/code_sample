defmodule Aptdeco.ProductTest do
  use Aptdeco.DataCase

  describe "from_params/1" do
    test "maps most params fields to struct fields" do
      params = params_fixture
      struct = Aptdeco.Product.from_params(params)

      assert struct.image_path == params.imagePath
      assert struct.is_set == params.isSet
      assert struct.qty == params.qty
      assert struct.region == params.region
      assert struct.title == params.title
    end

    test "parses 'undefined' fields" do
      params = params_fixture_with_undefineds()
      struct = Aptdeco.Product.from_params(params)

      assert struct.price == Money.parse!(params.price)
      refute struct.retail_price
      refute struct.set_qty
    end

    def params_fixture do
      %{
        imagePath: "https://picsum.photos/300/600",
        isSet: true,
        price: 399.0,
        qty: 4,
        region: "NY, NJ, PA & CT",
        retailPrice: 599.0,
        setQty: 4,
        title: "Modern Brown Faux Leather Dining Chair Set of 4"
      }
    end

    def params_fixture_with_undefineds do
      %{
        imagePath: "https://picsum.photos/300/600",
        isSet: false,
        price: 399.0,
        qty: 4,
        region: "NY, NJ, PA & CT",
        retailPrice: "undefined",
        setQty: "undefined",
        title: "Bauhaus Dining Chair"
      }
    end
  end
end
