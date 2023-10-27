#!/bin/bash
mkdir NewRelease
cp -r BizHawk/ExternalTools NewRelease
rm NewRelease/ExternalTools/SotnRandoTools/ToolConfig.ini
rm -r NewRelease/ExternalTools/SotnRandoTools/Replays/*
cd NewRelease
if [ "$2" == "lin" ]; then
    rm -r ExternalTools/SotnRandoTools/Updater
    7z a -tzip $HOME/Desktop/SotnRandoTools-Linux-$1.zip ExternalTools
else
    7z a -tzip $HOME/Desktop/SotnRandoTools-$1.zip ExternalTools
    rm -r ExternalTools/SotnRandoTools/Updater
    cd ExternalTools
    7z a -tzip $HOME/Desktop/Update-$1.zip SotnRandoTools/*
    7z a -tzip $HOME/Desktop/Update-$1.zip SotnRandoTools.dll
    cd ../..
    rm -r NewRelease
fi