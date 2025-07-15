log_level_to_num() {
    local level="$1"
    case "$level" in
        DEBUG) echo 1 ;;
        INFO) echo 2 ;;
        ERROR) echo 3 ;;
        *) echo 0 ;;  # Default for unknown levels
    esac
}

log() {
    local level=$1
    local all_args="$@"
    shift
    local message="$@"

    local level_priority
    local log_level_priority

    # Filter logs based on LOG_LEVEL
    log_level_priority=$(log_level_to_num "$level")
    level_priority=$(log_level_to_num "$LOG_LEVEL")
    if (( level_priority > log_level_priority )); then
        return
    fi

    local color
    case "$level" in
        INFO)
            color="\033[1;32m"
            ;;
        DEBUG)
            color="\033[1;34m" 
            ;;
        ERROR)
            color="\033[1;31m" 
            ;;
        *)
            color="\033[1;33m" 
            level="UNKNOWN"
            message="$all_args"
            ;;
    esac

    local template="${color}[${level}] [$0]\033[0m $message"
    echo -e "$template"
}

trace() {
    log ERROR "Error on line $LINENO: $BASH_COMMAND"
    exit 1
}

trap trace ERR