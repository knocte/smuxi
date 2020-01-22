#!/usr/bin/env bash
set -euxo pipefail

# this is the equivalent of using the 'build-packages' (not stage-packages) section in snapcraft
# but as we're not using the 'make' plugin, we need to this manually now
DEBIAN_FRONTEND=noninteractive apt install -y cli-common-dev \
                                              mono-devel \
                                              mono-xbuild \
                                              libnini-cil-dev \
                                              liblog4net-cil-dev \
                                              libgtk2.0-cil-dev \
                                              libgnome2.0-cil-dev \
                                              libglade2.0-cil-dev \
                                              libglib2.0-cil-dev \
                                              libgnome-vfs2.0-cil-dev \
                                              libart2.0-cil-dev \
                                              libnotify-cil-dev \
                                              libmessagingmenu-cil-dev \
                                              libindicate0.1-cil-dev \
                                              libindicate-dev \
                                              libgio2.0-cil-dev \
                                              gtk-sharp2-gapi \
                                              libdbus1.0-cil-dev \
                                              libdbus-glib1.0-cil-dev \
                                              libgtkspell-dev \
                                              libstfl0 \
                                              libstfl-dev \
                                              lsb-release \
                                              pkg-config \
                                              gettext \
                                              intltool \
                                              autoconf \
                                              automake \
                                              autotools-dev

./autogen.sh --prefix=`pwd`/staging
make
make install

snapcraft --destructive-mode
