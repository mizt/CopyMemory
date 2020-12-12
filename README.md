# CopyMemory

	MacBook Air (M1, 2020)
	Chip: M1
	Memory: 16GB

vs.

	MacBook Air (Retina, 13-inch, 2019)
	Processor: 1.6GHz Dual Intel Core i5
	Memory: 8GB 2133 MHz LPDDR3
	Graphics: Intel UHD Graphics 617 1536MB


### Build

`clang++ -std=c++17 -Wc++17-extensions -fobjc-arc -O3 -framework Cocoa ./CopyMemory.mm -o ./CopyMemory`

### Benchmark

Benchmark of memory copy speed in row and column directions.

||rows|cols|
|:--|:-:|:-:|
|M1|0.00001|0.0005|
|Intel|0.002|0.045|
