@ECHO OFF
setlocal EnableDelayedExpansion

ECHO "----------------------------------------------------"
ECHO "Cr‚ation d'un fichier PDF … partir d'un fichier HTML"
ECHO "----------------------------------------------------"

SET /p input_file="Entrez le nom du fichier HTML source :"
IF "%input_file%"=="" (
    ECHO "Le nom du fichier d'entr‚e n'a pas ‚t‚ donn‚." 
    GOTO :EOF
)
IF /I NOT "%input_file:~-5%" == ".html" (
    ECHO "Le fichier d'entr‚e n'est pas un fichier html." 
    GOTO :EOF
)

IF NOT exist %input_file% (
    ECHO "Le fichier d'entr‚e n'existe pas." 
    GOTO :EOF
)

SET /p output_file="Entrez le nom du fichier PDF de sortie :"
IF "%output_file%"=="" (
    ECHO "Le nom du fichier html d'entr‚e n'a pas ‚t‚ donn‚." 
    GOTO :EOF
)

IF /I NOT "%output_file:~-4%" == ".pdf" (
    ECHO "Le fichier de sortie n'est pas un fichier pdf." 
    GOTO :EOF
)

IF exist "%output_file%" (
    SET /p override="Le fichier existe d‚j…, souhaitez-vous l'‚craser ? [o|n]"
    IF /I NOT "!override!" == "o" GOTO :EOF
)

wkhtmltopdf.exe --enable-local-file-access --encoding utf8 --images --dpi 300 --zoom  0.9 %input_file% %output_file%
@ECHO ON