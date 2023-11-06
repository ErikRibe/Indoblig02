use context essentials2021
include gdrive-sheets

#For å kunne bruke funksjonene fra dcic-2021 må jeg inkludere pakken under.
#Det står også at pakken må plassers på toppen av filen
#som er gitt i oppgaveteksten.
include shared-gdrive(
  "dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
#Bruker sanitize og utvider Kodeeksempel 1 for å få
#kolonnedata for kolonnen energi returnert som data av typen String.
    sanitize energi using string-sanitizer
end

#Kaller på table under.
kWh-wealthy-consumer-data

#Er litt usikker på verdiene under. Usikker på om jeg missforstod teksten om bildrivstoff
#men tror det er riktig?
distance-travelled-per-day = 33.5 #Distanse i km
distance-per-unit-of-fuel = 8 #kilowatt-timer
energy-per-unit-of-fuel = 10  # kWh per liter som oppgitt sammen med formelen under.


#Formelen under er gitt i oppgave beskrivelsen.

energy-per-day = ( distance-travelled-per-day / 
                            distance-per-unit-of-fuel ) * 
                                        energy-per-unit-of-fuel

#Oppgave a:

#Oppgave er gjort over

#Oppgave b:

#Noe i oppgave b er lagt til over som er gitt i opppgaveteksten. Resten kommer under.

fun energi-to-number(str :: String) -> Number:
  #overfører data fra type String til type Number gitt i oppgavebeskrivelsen.
  doc: ```changes string value to number value```
  #Bruker cases og string-to-number funksjonen som blir anbefalt i oppgaveteksten
  #og eksemplet som er linket.
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => energy-per-day
  end
where:
  energi-to-number("") is energy-per-day
  energi-to-number("48") is 48
end

#Oppgave c:

#Fant denne på nettet og endret den. Virket som den var relevant.

#discount-fixed =
#  transform-column(event-data, "discount", cell-to-discount-code)

fixed-energi = 
  transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

#Koden inneholder:
#tabellen som skal transformeres, dvs. kWh-wealthy-consumer-data.
#kolonnenavn for kolonnen hvis data skal transformeres, - energi.
#funksjon for å transformere data, - energi-to-number.

#Oppgave d:

#Bruker sum for å legge sammen alt i kolonen energi.
Totalsum = sum(fixed-energi, "energi")

#Definerer hva som skal står i hvilke kolonner.
Table-Totalsum = table: komponent :: String, energi :: Number
  row: "Totalt energiforbruk", Totalsum
end

#Legger til ny rad med totalsummen som er definert over.
new-row = get-row(Table-Totalsum, 0)
add-row(fixed-energi, new-row)

#Oppgave e:

#Blir bedt om å bruke bar-chart i oppgaveteksten. Lager derfor en visuell diagram
#for energiforbruk.

bar-chart(fixed-energi, "komponent", "energi")
