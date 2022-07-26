defmodule Aptdeco.Product do
  defstruct title: "",
            price: Money.new(0),
            retail_price: Money.new(0),
            qty: 0,
            is_set: false,
            set_qty: 0,
            image_path: "",
            region: ""

  def from_params(%{
        title: title,
        price: price,
        retailPrice: retail_price,
        qty: qty,
        isSet: is_set,
        setQty: set_qty,
        imagePath: image_path,
        region: region
      }) do
    %__MODULE__{
      title: title,
      price: price,
      retail_price: retail_price,
      qty: qty,
      is_set: is_set,
      set_qty: set_qty,
      image_path: image_path,
      region: region
    }
  end
end

