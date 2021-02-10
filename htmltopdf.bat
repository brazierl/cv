@echo off
wkhtmltopdf.exe --enable-local-file-access --encoding utf8 index.html cv.pdf
@echo on