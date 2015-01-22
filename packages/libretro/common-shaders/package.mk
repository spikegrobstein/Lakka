################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="common-shaders"
PKG_VERSION="09885ea"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_URL="$LAKKA_MIRROR/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain Python:host retroarch:host"
PKG_PRIORITY="optional"
PKG_SECTION="RetroArch"
PKG_SHORTDESC="Collection of commonly used Cg shaders."
PKG_LONGDESC="Collection of commonly used Cg shaders. These shaders are usable by either HLSL and/or Cg runtime compilers. The cg2glsl script will translate most of these into GLSL shaders."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  mkdir -p .cg-shaders
  mv * .cg-shaders

  mkdir -p .glsl-shaders
  $ROOT/$TOOLCHAIN/bin/python $SYSROOT_PREFIX/usr/bin/cg2glsl.py .cg-shaders .glsl-shaders
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/shaders
  cp -r .glsl-shaders/* $INSTALL/usr/share/shaders
}
