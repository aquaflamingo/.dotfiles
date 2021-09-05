
# Interactive fixup
cfu() {
  target=$(git log --pretty=oneline master.. | fzf --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}

docker-start() {
    docker-machine start default
    eval $(docker-machine env default)
}

docker-stop() {
    docker-machine stop default
}

_docker() {
	if [ -z "${DOCKER_HOST}" ]; then
		eval $(docker-machine env)
	fi

	docker "$@"
}
alias docker=_docker
alias k=kubectl
