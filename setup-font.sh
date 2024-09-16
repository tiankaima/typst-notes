wget https://github.com/adobe-fonts/source-han-serif/releases/download/2.002R/01_SourceHanSerif.ttc.zip
wget https://github.com/tiankaima/typst-notes/releases/download/24_SP_TA%2Fv1/extras.zip
mkdir -p fonts
unzip 01_SourceHanSerif.ttc.zip -d fonts
unzip extras.zip -d fonts
rm 01_SourceHanSerif.ttc.zip