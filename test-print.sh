#!/bin/bash
#
# requires:
#  bash
#
set -e
set -x

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
