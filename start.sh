#!/bin/sh

cd /workspace

for FEATURE in features/*.feature
do
    build/CalculatorSteps &
    cucumber "$FEATURE"
done