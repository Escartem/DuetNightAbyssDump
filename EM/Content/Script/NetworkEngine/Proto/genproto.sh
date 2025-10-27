#!/bin/bash

find ./file -maxdepth 1 -name "*.proto" -not -name "ClientGate.proto" -exec rm {} \;

lua GenPropProto.lua