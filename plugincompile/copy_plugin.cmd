:: %1 workspaceFolder             C:\qsys_plugins\plugin
:: %2 workspaceFolderBasename     plugin

FOR /F "tokens=* USEBACKQ" %%F IN (`WhoAmI`) DO (
SET var=%%F
)
if %var% == desktop-k3b4pl2\eboy9 goto :EugenePC else goto :AnyOther

:AnyOther
::if not exist "%userprofile%\Documents\QSC\Q-Sys Designer\Plugins\%2" mkdir "%userprofile%\Documents\QSC\Q-Sys Designer\Plugins\%2"
COPY /Y "%1\%2.qplug" "%userprofile%\Documents\QSC\Q-Sys Designer\Plugins\%2.qplug"

exit 0

:: For My Computer
:EugenePC
::if not exist "H:\eboy9\Documents\QSC\Q-Sys Designer\Plugins\%2" mkdir "H:\eboy9\Documents\QSC\Q-Sys Designer\Plugins\%2"
COPY /Y "%1\%2.qplug" "H:\eboy9\Documents\QSC\Q-Sys Designer\Plugins\%2.qplug" 