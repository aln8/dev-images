# helper 
function cp_dev_container() {
	local supported_=(
		"cpp-ros2"
		"node-ros2"
		"py-ros2"
		"rust-ros2"
	)
	for key in "${supported_[@]}"
	do
		if [[ "$1" == ${key} ]]; then
			cp -r ~/dev/${key} .devcontainer 
		else
			echo "no support ${key}"
		fi
	done
}

alias rust-ros2-dev-con="cp_dev_container rust-ros2"
alias node-ros2-dev-con="cp_dev_container node-ros2"
alias py-ros2-dev-con="cp_dev_container py-ros2"
alias cpp-ros2-dev-con="cp_dev_container cpp-ros2"

