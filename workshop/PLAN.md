# Plan for workshopen

Dere skal bygge en nettside for et oppdiktet produkt med Claude Code. Repoet har ingen startkode, så dere velger språk, rammeverk og struktur selv. Hopp over innlogging (autentisering): siden trenger ingen brukerkontoer eller passord. Repoet har en PostgreSQL-database og en MCP-server for den. MCP (Model Context Protocol) gir agenten verktøy, her tilgang til databasen.

## Fem perspektiver

Hovedmålet med workshopen er å designe systemet rundt agenten, slik at agenten gjør godt arbeid. Nettsiden er det dere øver på. Tenk gjennom disse fem perspektivene i hver fase:

| Engineering | Hva teamet må tenke gjennom |
| --- | --- |
| Prompt | Hvordan beskriver vi oppgaven og ferdigkriteriene? |
| Context | Hvordan sørger vi for at agenten har relevant informasjon? |
| Harness | Hvilke skills, verktøy og automatiske kontroller trenger den? |
| Loop | Hvordan kan agenten teste og rette egen kode? |
| Graph | Hva bør gjøres i sekvens, og hva kan eventuelt delegeres parallelt? |

Hvert hint i planen sier hvilket perspektiv det hører til.

Bruk `/note` gjennom hele arbeidet. Hver gang dere tar en beslutning, ser agenten gjøre en feil, eller endrer oppsettet, skriv det ned. Kommandoen skriver til `workshop/NOTES.md` og stiller dere et oppfølgingsspørsmål. Hvis dere vet hvilket perspektiv notatet hører til, skriv det først: `prompt`, `context`, `harness`, `loop` eller `graph`.

## 1. Oppsett

Kjør `/setup`. Agenten starter databasen og hjelper dere med å koble til MCP-serveren `postgres`. Stegene står også i `README.md`.

Dere er ferdige når `pg_isready` svarer `accepting connections`, og `/mcp` i Claude Code viser at `postgres` er koblet til.

## 2. Velg produkt

Kjør `/generate-product`. Hvis dere vil ha et annet produkt, skriv `regenerate`. Hvis dere har to egne ord, gi dem til kommandoen: `/generate-product Viking Tinder`.

Dere er ferdige når `workshop/PRODUCT_BRIEF.md` beskriver et produkt som hele teamet vil bygge.

## 3. Planlegg

Dere kan snakke med en kunde for å finne ut hva brukerne trenger. Kjør `/talk-with-customer`. Agenten spiller personen fra brukerreisen i briefen. Still spørsmål om hva kunden trenger, og hva som er viktigst. Skriv `ferdig` når dere vil avslutte samtalen. Da får dere en oppsummering av behovene. Hvis dere blir usikre på et behov senere, kan dere snakke med kunden igjen.

1. Kjør `/grill-with-docs`. Agenten stiller dere spørsmål helt til dere er enige om hva dere skal bygge. Underveis skriver den beslutninger og begreper til filer.
2. Kjør `/to-spec`. Agenten lager en spesifikasjon (spec) fra samtalen.
3. Kjør `/to-tickets`. Agenten deler spesifikasjonen i oppgaver (tickets). Hver ticket sier hvilke andre tickets den venter på.

Dere er ferdige når dere har tickets for hjemmesiden og for databasen, og vet hvilke tickets som kan gjøres parallelt.

Hint (Prompt): Hvordan vet agenten at en ticket er ferdig? Kan den sjekke ferdigkriteriene selv, eller må den spørre dere?

Hint (Context): En ny økt med Claude Code husker ikke denne samtalen. Hvor finner neste agent beslutningene dere tok, og hvordan vet den at de finnes?

## 4. Del 1: Hjemmeside for produktet

Bygg en hjemmeside som presenterer produktet: navnet, hva produktet gjør, og hvem det er for. Kjør `/implement` med ticketene for hjemmesiden. Agenten må sjekke sitt eget arbeid før den sier at den er ferdig.

Dere er ferdige når siden kjører lokalt, og agenten selv har sett at siden viser produktet slik briefen beskriver det.

Hint (Loop): Hvordan kan Claude Code se om siden ser bra ut, uten å gjette ut fra koden og uten å be dere om skjermbilder? Claude Code kan lese bildefiler, og noen verktøy lar agenten styre en nettleser.

Hint (Graph): Hvordan kan to agenter jobbe på hver sin ticket samtidig, uten å endre de samme filene?

## 5. Del 2: Agenten og databasen

Gi produktet en funksjon som lagrer data i databasen, for eksempel meldinger, bestillinger eller anmeldelser. Agenten må bruke MCP-serveren `postgres` for å jobbe med databasen, ikke `psql` fra terminalen. Gjennom MCP-serveren lager agenten tabellene, legger inn testdata og sjekker resultatet.

Dere er ferdige når data som agenten skrev til databasen, vises på siden. Agenten må også ha sjekket dataene med en spørring gjennom MCP-serveren, ikke bare ved å lese sin egen kode.

Hint (Harness): Agenten leser ikke denne planen. Hvordan sørger dere for at den bruker MCP-serveren og ikke `psql`? MCP-serveren har full tilgang til databasen. Hvilke rettigheter trenger agenten egentlig?

## 6. Avslutning

Kjør `/note` uten tekst. Agenten henter notater fra økten og skriver dem under spørsmålene.

Dere er ferdige når alle spørsmålene i `workshop/NOTES.md` har et svar.
