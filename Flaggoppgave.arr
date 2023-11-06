use context essentials2021

#Først lager jeg alle flaggene med mål som jeg mener er riktig ut ifra den wikipedia
#linken vi ble gitt av Janis

#Norge-flagg
a = put-image(rectangle(330,50, "solid", "white"), 165, 120, rectangle(330,240, "solid", "red"))
b = put-image(rectangle(60, 240, "solid", "white"), 130, 120, a)
c = put-image(rectangle(330, 30, "solid", "dark blue"), 165, 120, b)
norge-flagg = put-image(rectangle(30, 240, "solid", "dark blue"), 130, 120, c)

#Island-flagg
d = put-image(rectangle(330,50, "solid", "white"), 165, 120, rectangle(330,240, "solid", "dark blue"))
e = put-image(rectangle(60, 240, "solid", "white"), 130, 120, d)
f = put-image(rectangle(330, 30, "solid", "red"), 165, 120, e)
island-flagg = put-image(rectangle(30, 240, "solid", "red"), 130, 120, f)

#Sverige-flagg
g = put-image(rectangle(330, 40, "solid", "yellow"), 165, 120, rectangle(330,240, "solid", "blue"))
h = put-image(rectangle(40, 240, "solid", "yellow"), 130, 120, g)
i = put-image(rectangle(330, 30, "solid", "yellow"), 165, 120, h)
sverige-flagg = put-image(rectangle(30, 240, "solid", "yellow"), 130, 120, i)

#Danmark-flagg
j = put-image(rectangle(330, 40, "solid", "white"), 165, 120, rectangle(330,240, "solid", "red"))
k = put-image(rectangle(40, 240, "solid", "white"), 130, 120, j)
l = put-image(rectangle(330, 30, "solid", "white"), 165, 120, k)
danmark-flagg = put-image(rectangle(30, 240, "solid", "white"), 130, 120, l)

#Finland-flagg
m = put-image(rectangle(330, 40, "solid", "dark blue"), 165, 120, rectangle(330,240, "solid", "white"))
n = put-image(rectangle(40, 240, "solid", "dark blue"), 130, 120, m)
o = put-image(rectangle(330, 30, "solid", "dark blue"), 165, 120, n)
finland-flagg = put-image(rectangle(30, 240, "solid", "dark blue"), 130, 120, o)

#Feroyene-flagg
p = put-image(rectangle(330,50, "solid", "blue"), 165, 120, rectangle(330,240, "solid", "white"))
q = put-image(rectangle(60, 240, "solid", "blue"), 130, 120, p)
r = put-image(rectangle(330, 30, "solid", "red"), 165, 120, q)
feroyene-flagg = put-image(rectangle(30, 240, "solid", "red"), 130, 120, r)

"Her er alle landene du kan lage flagg til"

#Under har jeg brukt table for å lage en tabell av alle landene du kan lage flagg til

nordisk-flagg = table: Land :: String
  row: "Norge"
  row: "Island"
  row: "Sverige"
  row: "Danmark"
  row: "Finland"
  row: "Feroyene"
end

#Kaller på funksjonen for at den skal være til stedet

nordisk-flagg

"Bruk funksjonen lag-nordisk-flagg(land)"

#Funksjonen under bruker tabellen over som verdier. Her er det viktig
#for personen som bruker funksjonen at han skriver inn riktig input
#for å få et fungerende resultat.
#Et eksempel på dette er: lag-nordisk-flagg("Feroyene")
#Hvis du skriver feil får du feilkoden som er skrevet under i funksjonen under "else"
#altså "Skjekk stavingen din og prøv på nytt".

fun lag-nordisk-flagg(Land :: String):
  doc: ```lager et bildet av flagget til landet som er angitt```
  if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(0)["Land"]):
    scale(10, norge-flagg)
  else if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(1)["Land"]):
    scale(10, island-flagg)
  else if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(2)["Land"]):
    scale(10, sverige-flagg)
  else if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(3)["Land"]):
    scale(10, danmark-flagg)
  else if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(4)["Land"]):
    scale(10, finland-flagg)
  else if string-to-lower(Land) == string-to-lower(nordisk-flagg.row-n(5)["Land"]):
    scale(10, feroyene-flagg)
  else:
    "Skjekk stavingen din og prøv på nytt"
  end
end