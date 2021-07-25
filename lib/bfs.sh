#! /bin/bash

graph=()
visits=()
stack=()

BFS=() {
    local v=$1;
    visited[v]=true;
    for i in "${graph[v]}"; do
        if [ "${visited[i]}" = true ]; then
            BFS $i;
        fi
    done

    stack+=("$v")
}

# надо протестить 
# reverse array foo
# echo "${foo[@]}"

reverse() {
    declare -n arr="$1" rev="$2"
    for i in "${arr[@]}"; do
        rev=("$i" "${rev[@]}")
    done
}

topological_sort() {
    # initial array
    for v in "${V[@]}"; do
        visited[v]=false;
    done

    stack=()
    BFS $1; # вызываем bfs из конкретной вершины 
}

main() {
    graph
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi
