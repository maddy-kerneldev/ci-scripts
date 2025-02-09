#!/bin/bash

PACKAGES=""

machine=$(uname -m)

. /etc/os-release

major="${VERSION_ID%%.*}"

if [[ "$major" -ge 21 ]]; then
    PACKAGES+=" clang llvm"
fi

if [[ "$machine" == "ppc64le" ]]; then
    PACKAGES+=" libcap-dev"
    PACKAGES+=" libcap-ng-dev"
    PACKAGES+=" libnuma-dev"
    PACKAGES+=" libpopt-dev"
    PACKAGES+=" libhugetlbfs-dev"
    PACKAGES+=" libmnl-dev"
    PACKAGES+=" libmount-dev"
    if [[ "$major" -ge 22 ]]; then
        PACKAGES+=" liburing-dev"
        PACKAGES+=" pkg-config"
        PACKAGES+=" libelf-dev"
        PACKAGES+=" libtraceevent-dev"
    fi

    # For the x86_64 container
    if [[ "$major" -ge 21 ]]; then
        PACKAGES+=" crossbuild-essential-amd64"
    fi
else
    PACKAGES+=" gcc-powerpc64le-linux-gnu g++-powerpc64le-linux-gnu"
fi

echo $PACKAGES
