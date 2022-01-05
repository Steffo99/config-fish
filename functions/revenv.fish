function revenv
	echo_progress "Removing previous venv..."
	rm -rfi venv
	echo
	echo_progress "Creating a new venv..."
	python -m venv venv
	echo
	echo_progress "Accessing the new venv..."
	source venv/bin/activate.fish
	echo
	echo_progress "Installing "
	echo_highlight "$argv"
	pip install $argv
	echo
	echo_progress "Done!"
	echo
end
