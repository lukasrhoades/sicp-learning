#!/usr/bin/env bash

no_damping_steps=$(./Exercise-1.36.1.scm | wc -l | awk '{print $1}')
damping_steps=$(./Exercise-1.36.2.scm | wc -l | awk '{print $1}')

echo "The number of steps without average damping is $no_damping_steps."
echo "The number of steps with average damping is $damping_steps."

ratio=$(awk -v v1="$no_damping_steps" -v v2="$damping_steps" 'BEGIN { printf "%.1f\n", v2 / v1 * 100 }') 

echo "Using average damping requires only $ratio% the number of steps."

