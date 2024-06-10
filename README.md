# Scala Native Metrics

```bash
Linux pop-os 6.8.0-76060800daily20240311-generic #202403110203~1715181801~22.04~aba43ee SMP PREEMPT_DYNAMIC Wed M x86_64 x86_64 x86_64 GNU/Linux

Ubuntu clang version 14.0.0-1ubuntu1.1
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

Scala CLI version: 1.3.2
Scala version (default): 3.4.2

openjdk 22.0.1 2024-04-16
OpenJDK Runtime Environment GraalVM CE 22.0.1+8.1 (build 22.0.1+8-jvmci-b01)
OpenJDK 64-Bit Server VM GraalVM CE 22.0.1+8.1 (build 22.0.1+8-jvmci-b01, mixed mode, sharing)

upx 3.96
UCL data compression library 1.03
zlib data compression library 1.2.11
LZMA SDK version 4.43
Copyright (C) 1996-2020 Markus Franz Xaver Johannes Oberhumer
Copyright (C) 1996-2020 Laszlo Molnar
Copyright (C) 2000-2020 John F. Reiser
Copyright (C) 2002-2020 Jens Medoch
Copyright (C) 1995-2005 Jean-loup Gailly and Mark Adler
Copyright (C) 1999-2006 Igor Pavlov
UPX comes with ABSOLUTELY NO WARRANTY; for details type 'upx -L'.

hyperfine 1.18.0

```

```bash
7.3M main_jvm
3.2M main_perf_boehm
908K main_perf_boehm_upx
3.9M main_perf_commix
1.1M main_perf_commix_upx
3.9M main_perf_immix
1.1M main_perf_immix_upx
3.2M main_perf_none
908K main_perf_none_upx
2.7M main_size
692K main_size_upx
4.1M main_static
1.2M main_static_upx
```

| Command              |       Mean [s] | Min [s] | Max [s] |     Relative |
| :------------------- | -------------: | ------: | ------: | -----------: |
| `./main_jvm`         |  1.177 ± 0.014 |   1.148 |   1.193 |         1.00 |
| `./main_perf_none`   |  2.504 ± 0.037 |   2.449 |   2.550 |  2.13 ± 0.04 |
| `./main_perf_boehm`  | 21.577 ± 0.586 |  20.907 |  22.724 | 18.33 ± 0.55 |
| `./main_perf_immix`  |  2.498 ± 0.027 |   2.464 |   2.547 |  2.12 ± 0.03 |
| `./main_perf_commix` |  2.270 ± 0.057 |   2.205 |   2.379 |  1.93 ± 0.05 |
