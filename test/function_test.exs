defmodule FunctionTest do
  use ExUnit.Case

  test "Multiplie une liste par deux" do 
    assert [2,4,6] == Enum.map([1,2,3], fn x -> x * 2 end)
  end


  test "Multiplie une liste par deux (multiligne, utilise le matching)" do 
    assert [2,4,6] = Enum.map([1,2,3], fn(x) -> 
      x * 2
    end)
  end

  test "Multiplie les impaires par deux, les paires par 5" do 
    assert [2,10,6] == Enum.map([1,2,3], 
      fn(x) when rem(x,2) == 1 -> 
          x * 2
        (x) when rem(x,2) == 0 ->
          x * 5
    end)
  end

  test "Multiplie les impaires par deux, les paires par 5, sauf 1, qui reste 1" do 
    assert [1,10,6] == Enum.map([1,2,3], 
      fn(1) -> 1
        (x) when rem(x,2) == 1 -> 
          x * 2
        (x) when rem(x,2) == 0 ->
          x * 5
    end)
  end

  test "Usage d'une fonction anonyme de maniere directe" do 
    fonction = fn(x) -> 
      x + 1 
    end
    assert 2 = fonction.(1)
  end

end
