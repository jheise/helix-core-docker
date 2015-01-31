#!/bin/bash

cd /helix/helix-core/bin
HELIX_ARGS="--zkSvr $ZK --cluster $CLUSTER"

if [ $MODE == "DISTRIBUTED" ]
then
    HELIX_ARGS="$HELIX_ARGS --controllerName $CONTROLLER --mode $MODE"
fi

./run-helix-controller.sh $HELIX_ARGS
