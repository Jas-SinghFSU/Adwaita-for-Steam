@echo off
ECHO ----------------------------
ECHO Adwaita for Steam Installer
ECHO ----------------------------

:: -----------------
:: --- VARIABLES ---
:: -----------------
:: --- Do not edit these ---

:: --- General ---
SET NO_ROUNDED_CORNERS=-e general/no_rounded_corners

:: --- Library ---
SET HIDE_WHATS_NEW=-e library/hide_whats_new
SET SIDEBAR_HOVER_ONLY=-e library/sidebar_hover

:: --- Login ---
SET LOGIN_HIDE_QR=-e login/hide_qr
SET LOGIN_HOVER_ONLY_QR=-e login/hover_qr

GOTO START_SECTION

:: ---------------
:: --- DEFAULT ---
:: ---------------
:DEFAULT_SECTION
SET CHOSEN_COLORTHEME=adwaita

:: SET CHOSEN_NO_ROUNDED_CORNERS=%NO_ROUNDED_CORNERS%

:: SET CHOSEN_HIDE_WHATS_NEW=%HIDE_WHATS_NEW%
:: SET CHOSEN_SIDEBAR_HOVER_ONLY=%SIDEBAR_HOVER_ONLY%

:: Only uncomment one
:: SET CHOSEN_LOGIN_QR=%LOGIN_HOVER_ONLY_QR%
:: SET CHOSEN_LOGIN_QR=%LOGIN_HIDE_QR%

:: SET CHOSEN_HIDE_BIG_PICTURE_BUTTON=%HIDE_BIG_PICTURE_BUTTON%
:: SET CHOSEN_HIDE_PAGE_URL=%HIDE_PAGE_URL%

GOTO INSTALL_SECTION

:: -------------
:: --- METRO ---
:: -------------
:METRO_SECTION
SET CHOSEN_COLORTHEME=metro
SET CHOSEN_NO_ROUNDED_CORNERS=%NO_ROUNDED_CORNERS%
GOTO INSTALL_SECTION

:: --------------
:: --- CUSTOM ---
:: --------------
:CUSTOM_SECTION
ECHO --- Colortheme ---
ECHO 1) adwaita
ECHO 2) breeze
ECHO 3) canta
ECHO 4) catppuccin-frappe
ECHO 5) catppuccin-macchiato
ECHO 6) catppuccin-mocha
ECHO 7) dracula
ECHO 8) everforest
ECHO 9) gruvbox
ECHO 10) kate
ECHO 11) metro
ECHO 12) nord
ECHO 13) one-pro
ECHO 14) pop
ECHO 16) tokyo-night
ECHO 17) tomorrow-night
ECHO 18) vapor
ECHO 19) vgui2
ECHO 19) yaru
SET /p MENUCHOICE="Enter a number: "
IF %MENUCHOICE%==1 SET CHOSEN_COLORTHEME=adwaita
IF %MENUCHOICE%==2 SET CHOSEN_COLORTHEME=breeze
IF %MENUCHOICE%==3 SET CHOSEN_COLORTHEME=canta
IF %MENUCHOICE%==4 SET CHOSEN_COLORTHEME=catppuccin-frappe
IF %MENUCHOICE%==5 SET CHOSEN_COLORTHEME=catppuccin-macchiato
IF %MENUCHOICE%==6 SET CHOSEN_COLORTHEME=catppuccin-mocha
IF %MENUCHOICE%==7 SET CHOSEN_COLORTHEME=dracula
IF %MENUCHOICE%==8 SET CHOSEN_COLORTHEME=everforest
IF %MENUCHOICE%==9 SET CHOSEN_COLORTHEME=gruvbox
IF %MENUCHOICE%==10 SET CHOSEN_COLORTHEME=kate
IF %MENUCHOICE%==11 SET CHOSEN_COLORTHEME=metro
IF %MENUCHOICE%==12 SET CHOSEN_COLORTHEME=nord
IF %MENUCHOICE%==13 SET CHOSEN_COLORTHEME=one-pro
IF %MENUCHOICE%==14 SET CHOSEN_COLORTHEME=pop
IF %MENUCHOICE%==15 SET CHOSEN_COLORTHEME=tokyo-night
IF %MENUCHOICE%==16 SET CHOSEN_COLORTHEME=tomorrow-night
IF %MENUCHOICE%==17 SET CHOSEN_COLORTHEME=vapor
IF %MENUCHOICE%==18 SET CHOSEN_COLORTHEME=vgui2
IF %MENUCHOICE%==19 SET CHOSEN_COLORTHEME=yaru
ECHO.

ECHO --- General ---
ECHO Disable Rounded Corners?
SET /p MENUCHOICE="(y/n): "
IF %MENUCHOICE%==y SET CHOSEN_NO_ROUNDED_CORNERS=%NO_ROUNDED_CORNERS%
ECHO.

ECHO --- Library ---
ECHO Hide the Library What's New Shelf?
SET /p MENUCHOICE="(y/n): "
IF %MENUCHOICE%==y SET CHOSEN_HIDE_WHATS_NEW=%HIDE_WHATS_NEW%
ECHO.
ECHO Show Library Sidebar only on mouse over?
SET /p MENUCHOICE="(y/n): "
IF %MENUCHOICE%==y SET CHOSEN_SIDEBAR_HOVER_ONLY=%SIDEBAR_HOVER_ONLY%
ECHO.

ECHO --- Login ---
ECHO Login Dialog Mobile QR Code
ECHO 1) Show
ECHO 2) Show only on mouse over
ECHO 3) Hide
SET /p MENUCHOICE="Enter a number: "
IF %MENUCHOICE%==2 SET CHOSEN_LOGIN_QR=%LOGIN_HOVER_ONLY_QR%
IF %MENUCHOICE%==3 SET CHOSEN_LOGIN_QR=%LOGIN_HIDE_QR%
ECHO.

GOTO INSTALL_SECTION

:: -------------
:: --- START ---
:: -------------
:START_SECTION

ECHO.
ECHO -------------------
ECHO --- Menu Select ---
ECHO -------------------
ECHO 1) Default Install (Quick)
ECHO 2) Metro Install (Quick)
ECHO 3) Custom Install (Interactive)
ECHO 4) Uninstall

SET /p MENUCHOICE="Enter a number: "

IF %MENUCHOICE%==2 GOTO METRO_SECTION
IF %MENUCHOICE%==3 GOTO CUSTOM_SECTION
IF %MENUCHOICE%==4 GOTO UNINSTALL_SECTION

GOTO DEFAULT_SECTION

:: --- Install ---
:INSTALL_SECTION
python install.py -c %CHOSEN_COLORTHEME% %CHOSEN_NO_ROUNDED_CORNERS% %CHOSEN_HIDE_WHATS_NEW% %CHOSEN_SIDEBAR_HOVER_ONLY% %CHOSEN_LOGIN_QR%
GOTO END_SECTION

:: --- Uninstall ---
:UNINSTALL_SECTION
python install.py -u
GOTO END_SECTION

:: --- End ---
:END_SECTION
PAUSE
