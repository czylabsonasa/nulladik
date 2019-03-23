Néhány alapszerkezetet érintünk. A legtöbb dolgot 
feladatmegoldás közben lehet (kell?) megtanulni.

# Témák:

1. Sztringek
1. Adatszerkezetek
1. Ciklusok
1. Elágazások
1. Függvények



## Sztringek
Idézőjelbe tett karaktersorozatok.<br>
[Próbáljuk](tutSztring.jl) ki:
```julia
kérdésEleje = "Hány cica "
kérdésVége = "túl sok?"
szám = 10
println(kérdésEleje*kérdésVége)
println("Nemtom, de $(szám) az elég kevés!")
```
Csak **olvassható** ! 


## Adatszerkezetek

### Rendezett n-esek
Egy rendezett n-est vesszővel elválasztott elemek (kerek) zárójelbe tételével hozunk létre:

Szintakszis:
```julia
        (elem1, elem2, ...)
```

Az elemek különböző típusba is tartozhatnak, 
melyekt ```1``` bázisú indexeléssel érhetjük el. 
Csak **olvasható** !

[Próbáljuk](tutTuple.jl) ki:
```julia
kedvencÁllataim = ("pingvin", "macska", "cukormókus")
println(kedvencÁllataim)
println(kedvencÁllataim[2])
# kedvencÁllataim[2]="inkább a kutya" # HIBA!
Dolgaim=("kutya",1, pi, exp)
println(Dolgaim[4](1))
```

## Szótárak
Két egymáshoz függvényszerűen kapcsolódó elempárokat tárolhatunk szótárban (is),
amit a Dict() függvénnyel hozunk létre.
**Írható-olvasható**.
A szótárt néha asszociatív tömbnek is nevezik. Nincs sorrend értelmezve a kulcs,érték párok között.


### Szintakszis:
Dict(kulcs1 => érték1, kulcs2 => érték2, ...)

### Példa: 
ismerőseinkez hozzárendeljük a telefonszámukat (amiből több is lehet, de ezzel most nem foglalkozunk)

[Próbáljuk](tutDict.jl) ki:
```julia
telefonkönyv = Dict("Mari" => "867-5309", "Kati" => "555-2368", "Aladár"=> "123-123-mz/x")
println(telefonkönyv["Mari"])
telefonkönyv["Mari"]="000-111111"
println(telefonkönyv["Mari"])
```


## Tömbök
Ha módosítható rendezett kollekciókra van szükség a tömböt használhatjuk,
amit vesszővel elválasztott elemek (szögletes) zárójelbe tételével hozunk létre:

### Szintakszis: 

[ elem1, elem2, ...]

[Próbáljuk](tutArr.jl) ki:
```julia
barátok = ["Frigyes", "Miki", "Barna", "Lali", "Mari"]
fibonacci = [1, 1, 2, 3, 5, 8, 13]
arr = fill(pi, 3)
println( arr )
```


## Ciklusok

### for:
```julia
for *változó* in *iterálható dolog*
    *törzs*
end
```

### while:
```julia
while *logikai kifejezés*
    *törzs*
end
```


[Próbáljuk](tutLoop.jl) ki:
```julia
for n in [ 1,2,3,4,5 ]
    print(n," ")
end
println()
n = 0
while n < 10
    n += 1
    print(n," ")
end
println()
```


## Elágazások
Az ```if``` segítségével feltételesen hajtódnak végre utasítások - értékelődnek ki kifejezések.

### if:
```julia
if *feltétel 1*
    *törzs 1*
elseif *feltétel 2*
    *törzs 2*
else
    *törzs 3*
end
```


[Próbáljuk](tutIf.jl) ki:
```julia
x, y = 1,2 
if x > y
    println(x)
else
    println(y)
end
println( (x < y) ? x : y ) # rövidebb változat
```

## Függvények

### Témák:
1. Megadásuk
1. Duck-typing a Julia-ban ( https://en.wikipedia.org/wiki/Duck_typing )
1. Mutating és non-mutating függvények (mutating=argumentumát módosító)
1. Magasabb rendű függvények


## Megadásuk

### Első lehetőség: function és end kulcsszavakkal
```julia
function f(x)
    x^2
end
```
### Második lehetőség: =-el
```julia
f2(x) = x^2
```
### Harmadik lehetőség: névtelen függvényként
```julia
f3 = x -> x^2
```

[Próbáljuk](tutFun.jl) ki:
```julia
f(42), f2(42), f3(42)
(1764, 1764, 1764)
```

## Duck-typing a Julia-ban
*"If it quacks like a duck, it's a duck."* 

Ha értelmezett az adott bemenetre a függvény által elvégzendő számolás 
akkor a függvény elvégzi azt típustól függetlenül. 
Például a fenti f működik négyzetes 
mátrixokra is, hiszen azok négyzetre emelhetők. 
Nem fog működni az f vektorokra hiszen azokra a négyzetre emelés nem definiált.

[Próbáljuk](tutFun2.jl) ki:
```julia
f(x) = x^2
A = rand(3, 3)
println(A)
println(f(A))
v = rand(3)
f(v) # HIBA!
```


## Mutating és non-mutating függvények
Megállapodás szerint csak az olyan fv-ek módosítják valamely argumentumuk tartalmlát (=mutating), <br>melyek neve !-el végződik. Nézzük meg például a sort és a sort! közti különbséget:
[Próbáljuk](tutFun3.jl) ki:
```julia
v = [3, 5, 2]
println(sort(v))
println(v)
sort!(v);
println(v)
```
A sort(v) visszaadja a v rendezett változatát, miközben a v változatlan marad.<br>
A sort!(v) hívásnál a v mögötti tartalom módosul, helyben rendezi a vektort:


## Magasabb rendű függvények
### broadcast
A broadcast egy magasabb rendű függvény melynek egyik argumentuma egy függvény- 
ezt a fv-t alkalmazza a broadcast az átadott adatszerkezet (másik argumentum) minden elemére. Például:
```julia
broadcast(f, [1, 2, 3])
```
egy tömböt eredményez melyben a mefelelő elemek az f eredeti elemeknél felvett értékei:

```julia
[f(1), f(2), f(3)]
```
Tehát az [ 1,2,3] vektor minden elemét négyzetre emeltük, nem magát a vektort.
Hasonlóan, de már névtelen függvénnyel az elemenkénti köbreemelés:

```julia
broadcast(x -> x^3, [1, 2, 3])
```
A broadcast helyettesíthető a fv. neve után írt .-tal:
```julia
f.([1, 2, 3])
```

[Próbáljuk](tutFun4.jl) ki!
