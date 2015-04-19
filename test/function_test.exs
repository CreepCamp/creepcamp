defmodule FunctionTest do
  use ExUnit.Case

  test "Multiplie une liste par deux" do 
    list = Enum.map([1,2,3], fn x -> x * 2 end)
    assert [2,4,6] == list
  end


  test "Multiplie une liste par deux (multiligne)" do 
    list = Enum.map([1,2,3], fn(x) -> 
      x * 2
    end)

    assert [2,4,6] == list
  end

end
