TITLE pushtodocker
@echo off
@echo Einloggen, falls noch nicht geschehen
docker login
set /p EINGABE= Bitte tagnamen(kleinbuchstaben oder auch nicht) eingeben:
docker push kubernetesclustercomputer/kubernetesprivate_repo:%EINGABE%
set /p EINGABE2= Bitte Imagenamen(kleinbuchstaben!) eingeben:
docker tag %EINGABE2% kubernetesclustercomputer/kubernetesprivate_repo:%EINGABE%
@echo Das Bild wird gepushed zu dem Repo kubernetesprivate_repo und ist unter dem Tag %EINGABE% zu finden.
docker push kubernetesclustercomputer/kubernetesprivate_repo:%EINGABE%
pause
