#!/usr/bin/env bash

## Attributed to bitnami/charts

set -x

files_changed="$(git show --pretty="" --name-only)"

# Adding || true to avoid "Process exited with code 1" errors
charts_dirs_changed="$(echo "$files_changed" | xargs dirname | grep -o "charts/[^/]*" | sort | uniq || true)"

# Using grep -c as a better alternative to wc -l when dealing with empty strings."
num_charts_changed="$(echo "$charts_dirs_changed" | grep -c "$2" || true)"
# num_version_bumps="$(echo "$files_changed" | grep Chart.yaml | xargs git show | grep -c "+version" || true)"

# We are dynamically generating chart version - this is no longer needed
# if [[ "$num_charts_changed" -ne "$num_version_bumps" ]]; then
#     # Changes done in charts but version not bumped -> ERROR
#     charts_changed_str="$(echo ${charts_dirs_changed[@]})"
#     echo "error=Detected changes in charts without version bump in Chart.yaml. Charts changed: ${num_charts_changed} ${charts_changed_str}. Version bumps detected: ${num_version_bumps}" >> $GITHUB_OUTPUT
#     echo "result=fail" >> $GITHUB_OUTPUT
#     exit 1

if [[ "$num_charts_changed" -eq "1" ]]; then
    # Changes done in only one chart -> OK
    chart_name=$(echo "$charts_dirs_changed" | sed "s|charts/||g")

    # set variables
    echo "chart=${chart_name}" >> $GITHUB_OUTPUT
    echo "chart_path=${charts_dirs_changed}" >> $GITHUB_OUTPUT
    echo "chart_version=$(yq '.version' $charts_dirs_changed/Chart.yaml)" >> $GITHUB_OUTPUT
    echo "result=ok" >> $GITHUB_OUTPUT
    exit 0

else
    # Changes done in more than chart -> FAIL
    charts_changed_str="$(echo ${charts_dirs_changed[@]})"
    echo "error=Changes detected in more than one chart directory: ${charts_changed_str}. The publish process will be stopped. Please create different commits for each chart." >> $GITHUB_OUTPUT
    echo "result=fail" >> $GITHUB_OUTPUT
    exit 1
fi