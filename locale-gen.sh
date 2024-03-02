#!/bin/sh
set -eu
: "${TARGET:=/tmp}"
self_path="$(realpath "$0")"
locales_path="${self_path%/*}/i18n/locales"
localedef \
	-i "${locales_path}"/en_ISO \
	-f UTF-8 \
	-c \
	"${TARGET:?}"/en_ISO.utf-8

printf 'ok: %s saved\n' "${TARGET:?}"/en_ISO.utf-8

printf 'try it out through the following envs:\n'
printf '\texport %s\n' "LC_ALL=en_ISO.utf-8" "LOCPATH='${TARGET:?}/en_ISO.utf-8'"
printf '\n'
printf 'note that you will have to locale-gen it for proper installation. temporary method:\n'
printf "\tln -sf '%s' '%s'\n" "${locales_path}"/en_ISO /usr/lib/i18n/locales/en_ISO

