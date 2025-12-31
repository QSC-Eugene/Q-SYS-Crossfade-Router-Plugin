:: %1 workspaceFolder             C:\qsys_plugins\plugin
:: %2 workspaceFolderBasename     plugin

FOR /F "tokens=*" %%g IN ('powershell "(new-object -COM Shell.Application).Namespace(0x05).Self.Path"') do (SET DocumentsFolder=%%g)
COPY /Y "%~1\%~2.qplug" "%userprofile%\Documents\QSC\Q-Sys Designer\Plugins\%~2.qplug"
