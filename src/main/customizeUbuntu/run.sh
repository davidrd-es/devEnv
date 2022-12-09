#!/usr/bin/env bash

# Load functions
source "modules/f_run.sh"

# Vars
WSL_USER=$(whoami)
PKG_LIST=''
f_configure_apt_repos
PKG_LIST_MAIN=$(f_create_packages_list)
f_apt_packages_install "${PKG_LIST_MAIN[@]}"
f_configure_custom_repos
f_custom_packages_install
f_configure_apps
f_run_checkers