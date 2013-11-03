#!/bin/bash
#
# requires:
#  bash
#
set -e
set -x

[[ -d tmp ]] || mkdir tmp

readonly vmbuilder_conf_path=./vmbuilder.conf

for title in vendor/buildbook-rhel6/${1:-"*"}; do
  [[ -d "${title}" ]] || continue
  (
   echo "===> ${title##*/} started"
   cd ${title}

   ln -fs ../../../vmbuilder.conf ${vmbuilder_conf_path}
   ../../vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ${vmbuilder_conf_path}
   rm -f box-disk1.raw
   rm -f ${vmbuilder_conf_path}
   echo "===> ${title##*/} finished"
  )
done
