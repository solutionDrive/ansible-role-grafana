#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PROJECT_DIR="$( dirname "${DIR}" )"
export PROJECT_NAME="$( basename ${PROJECT_DIR} | tr '[:upper:]' '[:lower:]' )"
export PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)"
export DOCKER_COMPOSE_YAML="${PROJECT_DIR}/scripts/docker-compose.yml"

function build_container {
    docker_compose_cmd build $@
}

function run_container {
    docker_compose_cmd up $@
}

function start_container {
    docker_compose_cmd up --no-start $@
    docker_compose_cmd start $@
}

function stop_container {
    docker_compose_cmd stop $@
}

function restart_container {
    stop_container $@
    start_container $@
}

function remove_container {
    docker_compose_cmd rm $@
}

function get_logs {
    docker_compose_cmd logs $@
}

function reset_container {
    remove_container -s -f $@
    start_container $@
}

function pull_container {
    docker_compose_cmd pull $@
}

function docker_compose_cmd {
    docker-compose \
        -f ${DOCKER_COMPOSE_YAML} \
        -p ${PROJECT_NAME} \
        $@
}


case "$1" in
    init)
        shift
        init_environment
        ;;
    build)
        shift
        build_container $@
        ;;
    run)
        shift
        run_container $@
        ;;
    start)
        shift
        start_container $@
        ;;
    stop)
        shift
        stop_container $@
        ;;
    restart)
        shift
        restart_container $@
        ;;
    reset)
        shift
        reset_container $@
        ;;
    remove|rm)
        shift
        remove_container $@
        ;;
    pull)
        shift
        pull_container $@
        ;;
    log|logs)
        shift
        get_logs $@
        ;;
    *)
        echo "usage: init/start/stop/run/restart/build/reset/remove/pull/logs"
        ;;
esac
