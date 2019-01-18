#!/bin/sh
# This script will symlink desired dotfiles to a home directory.

# Files to be excluded can be described in a list named '.doln-exclude'
# The exclusion list can be specified in the $excludeFile variable.

# TODO
# Backup: Directory make if non-existent.
# Flag: Parse dryrun flag.

echo "-- doln.sh --"

preflight() {
	# Conditions to reject.
	if [ ! -d '.git' ]; then echo "EXIT (preflight): execute this script within a git repository"; exit 1; fi
	if [ ! $numberOfArgs -eq 1 ]; then echo "EXIT (preflight): supply only a username to this script."; exit 1; fi

	# Conditions to warn.
	if [ ! -d '.config' ]; then echo "WARNING (preflight): before continuing, please verify that this script is used within a dotfile repository."; fi
	if [ ! -e $excludeFile ]; then echo "WARNING (preflight): ${excludeFile} is not found, no user exclusion list will be used."; fi
	
	# Prep.
	[ ! -e $backupPath ] && mkdir $backupPath || echo "WARNING (preflight): existing backup directory, may overwrite previous backups. ${backupDir}"

	echo

	# Conditions to accept.
	[ -e ${userHome} ] && [ -w ${userHome} ] && return
		
	# preflight error sink.
	cat << EOF
EXIT (preflight): unable to fly, will not continue script.

Regarding the argument-supplied user:
	Does their home directory exist? ${userHome}
	Do you have write-access to this directory?
EOF
	exit 1
}

makelink() {
	#[ ! -z $flagDry ] && echo "# dryrun: would have linked."; return
	ln -s $1 $2 && echo "() linked" || echo ")( not linked"
}

replacelink() {
	rm $2 2>&1
	ln -s $1 $2 && echo "() link replaced" || echo ")( link not replaced"
}

makedir() {
	if [ ! -e $1 ]; then
		mkdir -p $1 && echo "() made dir ${1}" && return 0 || echo ")( couldn't make dir ${1}" && return 1
	fi
}

backup() {
	#mv -b $1 $backupPath/$2 && echo "() backup'd" || echo ")( not backup'd"
	mv -b $1 $backupPath && echo "() backup'd" || echo ")( not backup'd"
}

export args=($@)
export numberOfArgs=($#)
user=$1
userHome=/home/${user}
repoPath=$(pwd)

excludeFile=".doln-exclude"
backupDir=".doln-backup"
backupPath=${userHome}/${backupDir}

main() {
	preflight


	# Flight confirmation.
	echo "Do you intend to dotfile the ${userHome} directory?"
	echo ":: Proceed?"
	echo -n "[Y/n] "
	read -n 1 yesno; echo; echo
	if [ ! ${yesno,,} == "y" ]; then
		echo "EXIT (main): left the cockpit."
		exit 0
	fi

	sleep 1; echo "Okay."; sleep 1;
	for num in $(seq 3 -1 1); do
		echo "${num} ..."
		sleep 1
	done; echo

	# Begin.
	for line in $(find . \( \
		-path './.git' \
		-o -path './.gitignore' \
		-o -path './doln.sh' \
		-o -path './README.md' \
                -o -path './LICENSE' \
		$(printf -- '-o -path %s ' $(grep -v '^#' .gitignore ${excludeFile} 2>&1)) \) -prune -o -type f -print | sed 's|^./||'); do

		pathFile=${userHome}/${line}
		repoFile=${repoPath}/${line}
		echo
		echo $pathFile

		# If file exists ...
		if [ -e $pathFile ]; then
			# ... as a symlink ...
			if [ -h $pathFile ]; then
				existLink=$(readlink $userHome/$line)
				# ... towards a path differing to the one we plan to implement.
				if [ ! $existLink = $repoFile ]; then
					echo ":> Update link? ${existLink}"
					echo "to ${repoFile}"
					echo -n "[Y/n] "
					read -n 1 chosen; echo

					if [ ${chosen,,} = "y" ]; then replacelink $repoFile $pathFile; fi
				else
					echo "-> Already linked."
				fi
				continue
			fi
			
			# ... as a file ...
			if [ -f $pathFile ]; then
				cmp --silent $pathFile $repoFile && isDifferent=false || isDifferent=true

				# ... that is identical to its equivalent in the repository.
				if [ $isDifferent = "false" ]; then
					echo ":= Identical files: ${line}"
					echo "   Link to repository?"
					echo -n "[Y/n] "
					read -n 1 chosen; echo

					if [ ${chosen,,} = "y" ]; then
						replacelink $repoFile $pathFile
					fi
				else
				# ... that differs from its equivalent in the repository.
					echo ":\ NOT IDENTICAL"
					echo "   Backup, then link to repository?"
					echo -n "[Y/n] "
					read -n 1 chosen; echo

					if [ ${chosen,,} = "y" ]; then
						backup $pathFile $line
						replacelink $repoFile $pathFile
					fi
				fi
				continue
			fi
		else
		# ... if not, verify the new addition.
			echo ":+ New addition: ${line}"
			echo "   Create new link?"
			echo -n "[Y/n] "
			read -n 1 chosen; echo

			if [ ${chosen,,} = "y" ]; then
				makedir $(dirname $pathFile) && makelink $repoFile $pathFile
			fi
		fi
		continue
	done
}

main
