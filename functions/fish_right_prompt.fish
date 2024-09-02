function fish_right_prompt
    if [ -f "compose.yml" ]
        set --local docker_pod_name (docker compose config --format="json" | jq --raw-output '.name')
        set --local docker_pod_states_output (docker compose ps --format="json" --all | jq --slurp --raw-output '.[].State')
        set --local docker_pod_created_count (echo "$docker_pod_states_output" | grep --only-matching 'created' - | wc --lines)
        set --local docker_pod_running_count (echo "$docker_pod_states_output" | grep --only-matching 'running' - | wc --lines)
        set --local docker_pod_restarting_count (echo "$docker_pod_states_output" | grep --only-matching 'restarting' - | wc --lines)
        set --local docker_pod_exited_count (echo "$docker_pod_states_output" | grep --only-matching 'exited' - | wc --lines)
        set --local docker_pod_paused_count (echo "$docker_pod_states_output" | grep --only-matching 'paused' - | wc --lines)
        set --local docker_pod_dead_count (echo "$docker_pod_states_output" | grep --only-matching 'dead' - | wc --lines)

        set_color white
        echo -n -- "{"
        set_color reset

        if [ "$docker_pod_dead_count" -gt 0 ]
            set_color --bold brblack
        else if [ "$docker_pod_exited_count" -gt 0 ]
            set_color --bold brred
        else if [ "$docker_pod_restarting_count" -gt 0 ]
            set_color --bold brmagenta
        else if [ "$docker_pod_paused_count" -gt 0 ]
            set_color --bold bryellow
        else if [ "$docker_pod_running_count" -gt 0 ]
            set_color --bold brgreen
        else if [ "$docker_pod_created_count" -gt 0 ]
            set_color --bold brcyan
        else
            set_color --bold brwhite
        end
        echo -n -- "$docker_pod_name"
        set_color reset

        if [ "$docker_pod_dead_count" -gt 0 ]
            set_color brblack
            echo -n -- " $docker_pod_dead_count"
            set_color reset
        end

        if [ "$docker_pod_exited_count" -gt 0 ]
            set_color brred
            echo -n -- " $docker_pod_exited_count"
            set_color reset
        end

        if [ "$docker_pod_restarting_count" -gt 0 ]
            set_color brmagenta
            echo -n -- " $docker_pod_restarting_count"
            set_color reset
        end

        if [ "$docker_pod_paused_count" -gt 0 ]
            set_color bryellow
            echo -n -- " $docker_pod_paused_count"
            set_color reset
        end

        if [ "$docker_pod_running_count" -gt 0 ]
            set_color brgreen
            echo -n -- " $docker_pod_running_count"
            set_color reset
        end

        if [ "$docker_pod_created_count" -gt 0 ]
            set_color brcyan
            echo -n -- " $docker_pod_created_count"
            set_color reset
        end

        set_color white
        echo -n -- "}"
        set_color reset
    end
end