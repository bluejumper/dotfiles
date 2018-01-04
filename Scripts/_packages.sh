#!/bin/bash

# Variables
help="\nName:
	_packages

Usage:
	_packages [OPTION]...

Description:
	Lists installed packages and/or dependencies used by NodeJS, either globally or within a project, using npm ls.
	Displays all packages and dependencies within project.json by default."

arguments="\n	-a, --all
		Displays all dependencies in the order of:
		Global > Production > Dev

	-g, --global
		Displays globally-installed packages.
	
	-p, --production
		Displays dependencies used in the project.

	-d, --dev
		Displays dependencies used in the development of the project."

examples="\nExamples:

_packages
-packages -g
_packages -p -d
_packages --all"

function _packages() {

	# Catch errors
	if [ "$#" -eq 0 ]; then
		echo "\n[/err] Missing operator."
		echo $help$arguments$examples
		return
	fi

	if [ "$#" -gt 3 ]; then
		echo "\n[/err] Too many operators."
		echo $examples
		return
	fi

	# Logic

	for var in "$@"; do
	#echo $var
		case $var in
			-[aA] | --all )
				echo "\n[--all]\nRunning...\nDisplaying all dependencies and packages...\n"
				echo "\n[Global]"
				npm ls --global --depth=0
				echo "\n[Production]"
				npm ls --production --depth=0
				echo "\n[Dev]"
				npm ls --dev --depth=0
				return
			;;
		esac
	done

	for var in "$@"; do
		case $var in
			-[gG] | --global )
				echo "\n[--global]\nRunning..."
				echo "\n[Global]"
				npm ls --global --depth=0
			;;
			
			-[pP] | --production )
				echo "\n[--production]\nRunning..."
				echo "\n[Production]"
				npm ls --production --depth=0
			;;

			-[dD] | --dev )
				echo "\n[--dev]\nRunning..."
				echo "\n[Dev]"
				npm ls --dev --depth=0
			;;
			
			*)
				echo "\n[/err] Unrecognized arguments"
				echo $arguments$examples
		esac
		return
	done
}