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
   echo "===> ${title##*/} started"
   cd ${title}
   pwd; ls
   ln -fs ../../../vmbuilder.conf ./.
   ../../vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf
   rm -f ./vmbuilder.conf
   echo "===> ${title##*/} finished"
  )
done
