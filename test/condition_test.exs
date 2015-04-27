
defmodule ConditionTest do 
  use ExUnit.Case

  test "simple case test" do 
    # Bon c'est un peux redondant, le test pourrai tres bien s'operé au niveau de la fonction ... mais passons.
    fonction = fn(x) ->
      # Cela me fait pensé que je ne vous ai pas indiqué l'operateur ^ 

      unevaleurfixe = 42

      case x do 
        %{id: id} ->
          id
        "hello" ->
          "bonjour"
        1 ->
          0
        ^unevaleurfixe ->
          42
        _ ->
          :ramassemiette
      end
    end

    assert 1 = fonction.(%{id: 1})
    assert "bonjour" = fonction.("hello")
    assert 0 = fonction.(1)
    # Le cas de 42 est particulier.
    # Dans le case, nous spécifion une variable, en temps normal celle ci devrai recuperé x, quel qu'il soit
    # Mais a cause de l'operateur ^ c'est une comparaison qui est effectuée.
    assert 42 = fonction.(42)
    # ainsi 43 n'est pas capturé par unevaleurfixe
    # et _ recupere la mise.
    assert :ramassemiette = fonction.(43)
  
    # On notera qu'il est important de bien traité le cas ou tout echoue, sans quoi une exception est levée.
    # Si jamais cela arrive.
  end

  test "usage de cond" do 
    # Cond est un peu plus basique, il ne permet que des operation booleenne.
    fonction = fn(x) ->
      cond do 
        1 + x == 2 -> 
         :ok
        x * 2 != 4 ->
         :ok
        0 ->
         "zero ?"
        true -> 
         "true ?"
      end
    end

    assert :ok = fonction.(1)
    assert :ok = fonction.(3)
    assert "zero ?" = fonction.(2)
    # Il y a un truc particulierement extraordinaire en Elixir
    # C'est que 0 est VRAI
    # ainsi dans notre cond, le ramasse miette, c'est 0, et non pas true.
    # True pourrai tres bien l'avoir été ... mais 0 rafle la mise vu qu'il arrive en premier.
    # C'est une bizarerie auquel il faudra faire attention pour les accros du C !

  end

  test "usage d'if" do 
    # Bon c'est plutot directe :)
    fonction = fn(x) ->
      if x == :ok do 
        :ok 
      else 
        :error
      end
    end

    assert :ok = fonction.(:ok)
    assert :error = fonction.(1)
  end

end
