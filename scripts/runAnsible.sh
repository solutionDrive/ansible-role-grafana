#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PROJECT_DIR="$( dirname "${DIR}" )"
export ROLE_DIR="${PROJECT_DIR}/tests/local/roles/external/solutiondrive.grafana"

rm -r "${ROLE_DIR}"
mkdir "${ROLE_DIR}"

cp -R $PROJECT_DIR/defaults/ $ROLE_DIR/defaults/
cp -R $PROJECT_DIR/handlers/ $ROLE_DIR/handlers/
cp -R $PROJECT_DIR/meta/ $ROLE_DIR/meta/
cp -R $PROJECT_DIR/tasks/ $ROLE_DIR/tasks/
cp -R $PROJECT_DIR/templates/ $ROLE_DIR/templates/
cp -R $PROJECT_DIR/vars/ $ROLE_DIR/vars/

ansible-playbook -i tests/inventory/hosts tests/playbook.yml
