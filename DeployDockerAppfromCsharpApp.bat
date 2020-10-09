@echo off
TITLE Deploy App from C# to Docker Container Copyright Julius Aigner
mode con cols=238 lines=85
cls
TITLE Check for Prerequisites
set Programm=docker
set Programm2=conhost
set Programm3=com.docker.proxy
set Programm4=wslhost
set Programm5 = vpnkit
set Programm6 = wsl
set Programm7 = vpnkit-bridge
set Programm8 = com.docker.backend

tasklist |find /i "%Programm%" >nul
tasklist |find /i "%Programm2%" >nul
tasklist |find /i "%Programm3%" >nul
tasklist |find /i "%Programm4%" >nul
tasklist |find /i "%Programm5%" >nul
tasklist |find /i "%Programm6%" >nul
tasklist |find /i "%Programm7%" >nul
tasklist |find /i "%Programm8%" >nul
if %errorlevel% == 0 (
echo Das Programm "%Programm%"  leauft gerade! Alles okay!
echo Das Programm "%Programm2%" leauft gerade! Alles okay!
echo Das Programm "%Programm3%" leauft gerade! Alles okay!
echo Das Programm "%Programm4%" leauft gerade! Alles okay!
echo Das Programm "%Programm5%" leauft gerade! Alles okay!
echo Das Programm "%Programm6%" leauft gerade! Alles okay!
echo Das Programm "%Programm7%" leauft gerade! Alles okay!
echo Das Programm "%Programm8%" leauft gerade! Alles okay!
pause
) else (
echo Das Programm "%Programm%"  leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm2%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm3%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm4%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm5%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm6%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm7%" leauft gerade nicht! Bitte Docker starten oder installieren!
echo Das Programm "%Programm8%" leauft gerade nicht! Bitte Docker starten oder installieren!
pause
exit
)

TITLE Auswahl
@echo Hauptmenue:
@echo (1) Appnamen eingeben
pause
cls
TITLE Deploy App from C# to Docker Container
set /p EINGABE1= Nummer eingeben:
REM COPYRIGHT JULIUS AIGNER 2020
@echo  %EINGABE1%
@echo Durch Druecken erreicht man die naechste Stufe und die App wird containerisiert.
@echo Der Dockerfile sollte folgendermassen aussehen:
@echo FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
@echo COPY bin/Release/netcoreapp3.1/publish/ App/
@echo WORKDIR /App
@echo ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]
pause
TITLE Erstellung
M:
cd M:\Dokumente\Visual Studio 2019\Projects\%Eingabe1%
dotnet publish -c Release
docker build -t counter-image -f Dockerfile .
docker create --name core-counter counter-image
@echo Image erfolgreich erstellt!
pause
cls
TITLE Untermenue
@echo Moeglichkeiten:
@echo (1) Ansehen des Containers
@echo (2) Start des Containers
@echo (3) Stop des Containers
@echo off
pause
set /p EINGABE2= Nummer eingeben:

if %EINGABE2%==1 goto Auswahl1
if %EINGABE2%==2 goto Auswahl2
if %EINGABE2%==2 goto Auswahl3

:Auswahl1
cls
TITLE Ausgabe Container
@echo Container ansehen:
docker ps -a
set /p EINGABE2= Um zurück zum Hauptmenue zu gelangen h druecken:
docker create --name %EINGABE1% %EINGABE1%-image
if %EINGABE2%==h goto Hauptmenue

:Auswahl2
TITLE Container-Start
@echo Start des Containers:
docker start %EINGABE1%
@echo Hier sind alle Container:
docker ps

set /p EINGABE2= Um zurueck zum Hauptmenue zu gelangen h druecken:
if %EINGABE2%==h goto Hauptmenue

:Auswahl3
TITLE Container-Stop
@echo Stop des Containers:
docker stop %EINGABE1%
@echo Hier sind alle Container:
docker ps

set /p EINGABE2= Um zurueck zum Hauptmenue zu gelangen h druecken:
if %EINGABE2%==h goto Hauptmenue

:Hauptmenue
TITLE Moeglichkeiten:
@echo Moeglichkeiten:
@echo (1) Ansehen des Containers
@echo (2) Start des Containers
@echo (3) Stop des Containers
@echo off
pause
set /p EINGABE2= Nummer eingeben:
if %EINGABE2%==1 goto Auswahl1
if %EINGABE2%==2 goto Auswahl2
if %EINGABE2%==2 goto Auswahl3
if %EINGABE2%==h goto start

:start
TITLE Hauptmenue
@echo Hauptmenue:
@echo (1) Appnamen eingeben
@echo off
pause
cls
set /p EINGABE1= Nummer eingeben:

@echo  %EINGABE1%
TITLE Auswahl
@echo Durch Druecken erreicht man die naechste Stufe und die App wird containerisiert.
@echo Der Dockerfile sollte folgendermassen aussehen:
@echo FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
@echo COPY bin/Release/netcoreapp3.1/publish/ App/
@echo WORKDIR /App
@echo ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]
pause
