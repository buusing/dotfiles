#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/Code
SITES=$HOME/Herd
BLADE=$CODE/blade-ui-kit
LARAVEL=$CODE/laravel

# Sites
git clone git@github.com:buusing/wedding.git $SITES/wedding
