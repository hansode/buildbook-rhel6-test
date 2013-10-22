#!/bin/bash
#
# requires:
#  bash
#
set -e
set -x

readonly abs_dirname=$(cd ${BASH_SOURCE[0]%%*/} && pwd)
echo abs_dirname:${abs_dirname}

[[ -d tmp ]] || mkdir tmp

for title in vendor/buildbook-rhel6/*; do
  [[ -d "${title}" ]] || continue
  (
   echo ${title##*/}
   cd ${title}
   pwd; ls
   ../../vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ../../../vmbuilder.conf
  )
done
