TITLE Deploy App from C# to Docker Container Copyright Julius Aigner
mode con cols=238 lines=85
cls
@echo Hauptmenue:
@echo (1) Appnamen eingeben
@echo off
pause
cls
TITLE Deploy App from C# to Docker Container
set /p EINGABE= Nummer eingeben:
REM COPYRIGHT JULIUS AIGNER 2020
set /p EINGABE1=Namen eingeben:
@echo  %EINGABE1%
@echo Durch Druecken erreicht man die naechste Stufe und die App wird containerisiert.
@echo Der Dockerfile sollte folgendermassen aussehen:
@echo FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
@echo COPY bin/Release/netcoreapp3.1/publish/App/
@echo WORKDIR /App
@echo ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]
pause
TITLE Erstellung
M:
cd M:\Dokumente\Visual Studio 2019\Projects\%Eingabe1%\App
dotnet publish -c Release
@echo (1) Imagenamen eingeben (nur lowercase!)
set /p EINGABE3= Namen des Containers eingeben:
docker build -t %Eingabe3% -f Dockerfile .
docker create --name core-counter %Eingabe3%
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
if %EINGABE2%==h goto Hauptmenue

:Auswahl2
cls
TITLE Container-Start
@echo Start des Containers:
docker start %EINGABE1%
@echo Hier sind alle Container:
docker ps

set /p EINGABE2= Um zurueck zum Hauptmenue zu gelangen h druecken:
if %EINGABE2%==h goto Hauptmenue

:Auswahl3
cls
TITLE Container-Stop
@echo Stop des Containers:
docker stop %EINGABE1%
@echo Hier sind alle Container:
docker ps

set /p EINGABE2= Um zurueck zum Hauptmenue zu gelangen h druecken:
if %EINGABE2%==h goto Hauptmenue

:Hauptmenue
cls
TITLE Moeglichkeiten:
@echo Moeglichkeiten:
@echo (1) Ansehen des Containers
@echo (2) Start des Containers
@echo (3) Stop des Containers
@echo off
pause
set /p EINGABE2= Nummer eingeben oder h zum Menue:
if %EINGABE2%==1 goto Auswahl1
if %EINGABE2%==2 goto Auswahl2
if %EINGABE2%==2 goto Auswahl3
if %EINGABE2%==h goto start

:start
cls
@echo Hauptmenue:
@echo (1) Appnamen eingeben
@echo off
pause
cls
set /p EINGABE1= Nummer eingeben:

@echo  %EINGABE1%
@echo Durch Druecken erreicht man die naechste Stufe und die App wird containerisiert.
@echo Der Dockerfile sollte folgendermassen aussehen:
@echo FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
@echo COPY bin/Release/netcoreapp3.1/publish/ App/
@echo WORKDIR /App
@echo ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]
pause
