#!/bin/bash -x
mount -t cgroup cgroup_root /sys/fs/cgroup
cd /sys/fs/cgroup/memory

# Create two cgroups
mkdir system_group
mkdir app_group

# Move everything on the system into system cgroup
cd system_group
for pid in `ps -eo pid`; do
    echo $pid >> tasks
done
