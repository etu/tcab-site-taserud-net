---
title: Cyberresiliens mot ransomware, kan man skydda sig?
date: "2023-12-28T15:00:00+01:00"
description: Hur vi jobbar preventivt med att skydda oss mot ransomware, hur gör ni?
ogImagePath: /blog/2023/12/cyber-resilience-against-ransomware.png
---
![Bild av en imaginär cyberattack](/blog/2023/12/cyber-resilience-against-ransomware.png)

[English translation here.](/en/blog/2023/12/cyber-resilience-against-ransomware/)

Det är relativt ofta man hör om större företag som får problem med
cyberattacker, här nyligen har man kunnat läsa om [Svenska kyrkan](https://www.svt.se/nyheter/inrikes/svenska-kyrkan-varnades-innan-it-attacken-tappte-inte-till-sakerhetshal)
som har utsatts, sedan har [Coop](https://www.svt.se/nyheter/inrikes/it-attacken-mot-coop-detta-har-hant)
utsatts för omfattande ransomware.

Har man ett stort IT-system som är driftkritiskt på något vis så är
det mycket viktigt att tänka igenom hur man hanterar och planerar för
att hantera ett ransomware.

Då spelar det ingen roll om det är en personlig laptop, en terminal
som sitter uppe i en butik eller om det är en serverinfrastruktur för
en större site.

Något som är säkert är dock att ett större system såklart är svårare
att säkra än ett mindre - men det innebär ju inte att man inte ska
försöka.

## Vi är inte rädda - för vi har en plan
Vi känner oss väldigt säkra på att vi skulle kunna hantera en
ransomware-attack då vi har en väl utarbetad plan för hur det skulle
gå till och vi har tagit till förebyggande åtgärder för att minimera
skadan av en attack.

Vi tänker enligt strategin att vi ska skydda oss i många led samt att
vi ska kunna återhämta oss ifall det värsta inträffar.

Kontakta oss om ni behöver hjälp att bygga upp er strategi eller få
tips, råd och hjälp att bygga upp er cyberresiliens mot
ransomware. [Kontakta oss här](/#kontakt)

### Del 1: Minimera exponering
Första försvaret av ett datorsystem är alltid att minemera
exponeringsytan, det gör att det minimerar risken att någon tar sig in
och att det blir ett problem till att börja med.

Detta görs genom en restrektiv brandvägg, stängda portar som standard,
inte tillåta lösenordsinloggning till administrativa funktioner utan
kräva nycklar eller 2FA.

### Del 2: Partitionering av diskar
Filsystemet med operativsystemet är i största möjliga mån enbart
tillgängligt för att läsas och inte att skrivas till. Sedan så är
resterande filsystem i största möjliga mån markerade med `noexec` som
mount-flagga vilken gör att man inte kan köra program från de
filsystemen, det går ju fortfarande att köra scripts så klart så länge
språket man evaluerar redan är installerat på systemet.

### Del 3: Bygger på NixOS
Om det mot förmodan är något som tar sig in och blir del av
operativsystemets partition så har vi en säkerhet av att vi bygger på
NixOS. Detta gör att vi vid nästa utrullning av systemet kastar bort
allt som inte är del av konfigurationen så vi bara har det vi
förväntar oss i operativsystemet.

### Del 4: Använder ZFS snapshots
Vi tar snapshots regelbundet. Då dessa är oföränderliga efter att de
skapats så kan vi alltid rulla tillbaka till en tidigare snapshot på
det påverkade systemet om vi skulle upptäcka att något data blivit
påverkat av ett ransomware.

### Del 5: Synkroniserar ZFS snapshots
Vi synkroniserar snapshots från produktionssystem till backupsystem
där det är backupsystemet som kör detta jobb. Detta gör att inget
produktionssystem har tillgång till backupsystemet för att förstöra
något i backupen. Det innebär också att det går att låsa ner
backupsystemet genom att inte köra andra saker än synkronisering av
backuper samt dataintegritetskontroller.

### Del 6: Bygger på NixOS
Denna punkt igen, jag vet. Men om någon nu skulle ta sig in i en dator
och lyckas få ett riktigt fotfäste, i form av att ta sig in i en
dators firmware eller liknande så bygger vi ju på NixOS.

Det gör att vi alltid kan införskaffa ett nytt system att rulla ut
samma system på för att sedan återställa backupen dit istället. Då får
vi en ny installation med exakt samma konfiguration som tidigare.

## Hur skyddar du dig och ditt företag mot ransomware?
Kontakta oss om ni behöver hjälp att bygga upp er strategi eller få
tips, råd och hjälp att bygga upp er cyberresiliens mot
ransomware. [Kontakta oss här](/#kontakt)
