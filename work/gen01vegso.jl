# teljes bináris fa bejárása
function gen01( hossz )
  akt = fill( '_',hossz ) # -> fill
  function bejár( szint )
    if szint > hossz
      println( join(akt) )
    else
      akt[ szint ] = '0'
      bejár( 1+szint )
      akt[ szint ] = '1'
      bejár( 1+szint )
    end
  end
end
