REM Install pyepics
set NOLIBCA=1
%PYTHON% -m pip install . --no-deps -vv

setlocal EnableDelayedExpansion

REM Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
)
