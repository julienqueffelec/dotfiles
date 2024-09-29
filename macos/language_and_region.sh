#!/usr/bin/env bash

print_info "• Language & Region"

execute "defaults write -g AppleLanguages -array 'en_US'" \
    "Set language"
