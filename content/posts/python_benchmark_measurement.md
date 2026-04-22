---
title: "Benchmark and Measurement"
date: 2024-01-17T13:59:10+08:00
tags: [ "python" ]
categories: [ "Posts", "Essential"  ]
summary: "Different ways to do benchmark and measurement with Python code."
draft: false
---
{{< lead >}}
*Benchmarking is a broader concept that involves assessing the overall performance of a system or operations by repeating it ***multiple times***, while measuring the time taken is just a specific aspect of benchmarking that focuses on evaluating the execution time of specific code ***once***.*
{{< /lead >}}

## Measurement

In Python, measuring time taken involves specifically tracking the execution time of a particular piece of code or function. 
It is used to analyze and measure the amount of time taken to complete a specific code segments.

Timing code execution can be done using various techniques, such as the `time` module, and the `timeit` module, or more sophisticated tools like `cProfile` module. 

This process focuses on measuring the time it takes for a specific piece of code to run.

## Benchmark

Benchmarking involves evaluating the performance of a piece of code and comparing it to a reference point or a standard. 
It is used to assess the overall performance of a specific operation and compare it against an implementation or by repeating the operation multiple times.

Benchmarking often involves running a set of standardized tests and collecting metrics (execution time, memory usage, other performance indicators), and repeating it many times. 

## Measuring Code 

Here, I show a few ways how to measure the execution time taken for a Python script.

Below is the most common way to demonstration the use of `time` module to measure the execution time.

```python
import time

start: float = time.perf_counter()
...
end: float = time.perf_counter()

print(f'Completed within [{end-start:.2f} sec].')
```

However, I'm prefer to the use of `timeit` module most of the time.

```python
from timeit import default_timer as timer

start: float = timer()
...
end: float = timer()

print(f'Completed within [{end-start:.2f} sec].')
```

> Difference between `time.perf_counter()` and `timeit.default_timer()`.
> Using `timeit()` will temporary turns off garbage collection during timeing, and it makes independent timings more comparable. 
> Also, `timeit.default_timer()` will adstract away platform-specific details and chooses an appropriate timer.

## Benchmarking Code

Here, I will demonstrate how I use the `repeat` function to benchmark a specific piece of code, by repeating it 5 times with 10000 executions per loop, and get the `min()` (best case out of 5).

```python
from timeit import repeat, default_timer as timer

# Repeat the measurement 5 times with 10000 executions per loop
#result: float = min(repeat(stmt, setup, timer=timer, repeat=5, number=10_000))

new_list: str = """my_list: list[int] = [i for i in range(10)]"""

result: float = min(repeat(new_list, timer=timer, repeat=5, number=10_000))
### Best time : 0.001513827999588102 sec

print(f'Best time : {result} sec')
```

## Links

 - [Python Benchmarking Best Practices](https://superfastpython.com/python-benchmarking-best-practices/)


