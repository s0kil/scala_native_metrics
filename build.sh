#!/usr/bin/env bash

# https://scala-cli.virtuslab.org/docs/reference/cli-options
# https://scala-native.org/en/stable/user/sbt.html

rm -f main_*

scala-cli --power package Main.scala -o main_jvm \
    --force \
    --assembly

scala-cli --power package Main.scala -o main_size \
    --force \
    --native \
    --native-mode release-size

scala-cli --power package Main.scala -o main_perf_immix \
    --force \
    --native \
    --native-mode release-full \
    --native-lto thin \
    --native-gc immix

scala-cli --power package Main.scala -o main_perf_commix \
    --force \
    --native \
    --native-mode release-full \
    --native-lto thin \
    --native-gc commix

scala-cli --power package Main.scala -o main_perf_boehm \
    --force \
    --native \
    --native-mode release-full \
    --native-lto thin \
    --native-gc boehm

scala-cli --power package Main.scala -o main_perf_none \
    --force \
    --native \
    --native-mode release-full \
    --native-lto thin \
    --native-gc none

scala-cli --power package Main.scala -o main_static \
    --force \
    --native \
    --native-mode release-full \
    --native-lto thin \
    --native-linking "-static"

strip --verbose main_*

upx --best -f main_size -o main_size_upx
upx --best -f main_perf_immix -o main_perf_immix_upx
upx --best -f main_perf_commix -o main_perf_commix_upx
upx --best -f main_perf_boehm -o main_perf_boehm_upx
upx --best -f main_perf_none -o main_perf_none_upx
upx --best -f main_static -o main_static_upx

true >README.md # Clear File
{
    echo '# Scala Native Metrics' && printf '\n'

    echo '```bash'
    uname --all && printf '\n'
    clang --version && printf '\n'
    scala-cli --version && printf '\n'
    java --version && printf '\n'
    upx --version && printf '\n'
    hyperfine --version && printf '\n'
    echo '```'

    echo '```bash'
    ls -sh --format=single-column main_*
    echo '```'
} >>README.md
