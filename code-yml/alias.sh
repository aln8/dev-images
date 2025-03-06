export UID=$(id -u)
export GID=$(id -g)

dev-con(){
  local store_dir_="~/.myrc"

  cp -rf ${store_dir_}/devcontainer .devcontainer/
}
