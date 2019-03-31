<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.1/dist/katex.min.css" integrity="sha384-dbVIfZGuN1Yq7/1Ocstc1lUEm+AT+/rCkibIcC/OmWo5f0EA48Vf8CytHzGrSwbQ" crossorigin="anonymous">

<script defer src="https://cdn.jsdelivr.net/npm/katex@0.10.1/dist/katex.min.js" integrity="sha384-2BKqo+exmr9su6dir+qCw08N2ZKRucY4PrGQPPWU1A7FtlCGjmEGFqXCv5nyM5Ij" crossorigin="anonymous">
</script>

<script defer src="https://cdn.jsdelivr.net/npm/katex@0.10.1/dist/contrib/auto-render.min.js" integrity="sha384-kWPLUVMOks5AQFrykwIup5lo0m3iMkkHrD0uJ4H5cjeGihAutqP0yW0J6dpFiVkI" crossorigin="anonymous"
      onload="renderMathInElement(document.body);">
</script>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.5.1/katex.min.css">

# [prímszámok](https://hu.wikipedia.org/wiki/Pr%C3%ADmsz%C3%A1mok)

```Röviden:``` Legyen az univerzumunk az egytől 
nagyobb pozitív egészek halmaza. <br>
Vannak olyan számok melyeknek az 
```1```-en és önmagukon kívül nincs más osztójuk.<br>
Nevezzük ezeket prímnek a többit összetettnek. 
(Az ```1``` sem nem prím, sem nem összetett.)<br>

```Egymondatban:``` egytől nagyobb ```n``` szám pontosan akkor nem prím, 
ha van ```2``` és ```n−1``` között osztója.

### Feladat:
Egy függvény megvalósítása mely eldönti a paraméterül kapott számról, hogy prím-e (```true```) vagy sem (```false```)

### Megoldás:
```julia
function isPrime0(n)
  if n<2 return false end
  for d in 2:(n-1)
    if 0==mod(n,d) return false end
  end
  true
end
```

### Új ismeret: 
```div``` és ```mod``` használata. 


### Használat:
```julia
for n in 1:10
  println(n,":",isPrime0(n))
end
```

### Finomabb megoldás:
```julia
function isPrime1(n)
  if n<5 return (false,true,true,false)[n] end
  if 0==mod(n,2) || 0==mod(n,3) return false end
  d,delta=5,2
  while d*d<=n # itt nekünk kell kezelni a ciklusváltozót
    if 0==mod(n,d) return false end
    d+=delta
    delta=6-delta
  end
  true
end
```

### Háttér:
* Megpróbáljuk kevesebb számra tesztelni, hogy osztója-e ```n```-nek:
   * Egy ```4```-től nagyobb prímszám ```1``` vagy ```5``` maradékot ad ```6```-tal osztva, <br>
   ezért csak ezeken megyünk végig.
* Egy összetett számnak biztosan olyan osztója mely nem nagyobb mint $\sqrt{n}$, <br>
azaz ettől nagyobb számra nem kell tesztelni.



