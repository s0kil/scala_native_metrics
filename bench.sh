#!/usr/bin/env bash

# https://scala-native.org/en/stable/user/runtime.html
export GC_NPROCS
GC_NPROCS=$(nproc)

# https://github.com/sharkdp/hyperfine
hyperfine \
    --export-markdown BENCHMARK.md \
    --warmup 3 \
    './main_jvm' './main_perf_none' './main_perf_boehm' './main_perf_immix' './main_perf_commix'

cat BENCHMARK.md >>README.md
