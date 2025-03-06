variable "REGISTRY" {
  default = ""
}

variable "TAG_PREFIX" {
  default = ""
}

variable "manifest" {
  default = false
}

variable "os_vers" {
  default = "jammy"
}

variable "archs" {
  default = "amd64"
}

variable "targets"{
  default = "base"
}

variable "ros_version" {
  default = {
    "focal": "foxy",
    "jammy": "humble",
    "noble": "jazzy"
  }
}

variable "ros_build_ver" {
    default = "jazzy"
}

variable "go_version" {
    default = "1.24.0"
}

function "gen_targets" {
  params = []
  result = [for s in split(",", targets): trimspace(s)]
}

function "gen_os_vers" {
  params = []
  result = [for s in split(",", os_vers): trimspace(s)]
}

function "gen_archs" {
  params = []
  result = [for s in split(",", archs): trimspace(s)]
}

function "gen_platforms" {
  params = []
  result = manifest ? formatlist("linux/%s", gen_archs()) : []
}

function "gen_div_archs" {
  params = []
  result = manifest ? [""] : gen_archs()
}

group "default" {
  targets = ["ubuntu"]
}

target "_default_args" {
  platforms = gen_platforms()
}

target "ubuntu" {
  inherits = ["_default_args"]
  name = format("ubuntu-${tgt}-${os_ver}%s", manifest ? "" : "-${arch}")
  dockerfile = "docker/dockerfile.ubuntu"
  matrix = {
    tgt = gen_targets()
    os_ver = gen_os_vers()
    arch = gen_div_archs()
  }
  target = tgt
  args = {
    OS_VERSION = os_ver
    OS_ARCH = manifest ? "amd64" : arch
    ROS_DISTRO = ros_version[os_ver]
    ROS_BUILD_DISTRO = ros_build_ver
    GO_VERSION = go_version
  }
  tags = [ format(
    "%subuntu-${os_ver}-${tgt}:%s",
    notequal(REGISTRY, "") ? "${REGISTRY}/" : "",
    manifest
      ? notequal(TAG_PREFIX, "") ? "latest" : TAG_PREFIX
      : notequal(TAG_PREFIX, "") ? "${TAG_PREFIX}-${arch}" : arch
  )]
}

