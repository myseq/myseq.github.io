---
title: "Mistake in List Iteration"
date: 2025-01-24T16:06:59+08:00
tags: [ "101", "python" ]
categories: [ "Posts"  ]
summary: "Unexpected behaviour in your Python loops."
authors:
draft: false
---
{{< lead >}}
*Never ever modify your `list` while iterating through the list.*
{{< /lead >}}

*This post is taking from Indently's shorts at <https://www.youtube.com/shorts/X8KL7iAk-7k>.*

## List Item Removal

Suppose we want to remove an item within a list.
Such as 'B'.

And below is one of the common mistakes that junior developer makes.
It uses for-loop to remove the item while iterating through the list.

But the result shows an unexpected behavior here.
See the code below.

```python
items1 = ['A', 'B', 'C', 'D', 'E']
items2 = []

for item in items1:
    if item == 'B':
        items1.remove('B')
    else:
        items2.append(item)

print(items2)
# ['A', 'D', 'E']
```

Supposed we are expecting the result to be `['A', 'C', 'D', 'E']`.
**If you want to modify the original list, simply create another list.**

And below here is the correct way.

```python
items1 = ['A', 'B', 'C', 'D', 'E']
items2 = [ item for item in items1 if item != 'B' ]
print(items2)
# ['A', 'C', 'D', 'E']
```

## Links

Indently's YT video at [10 Nooby Mistakes Devs Often Make In Python](https://www.youtube.com/watch?v=ankki-yKgSc):

{{< youtube id="ankki-yKgSc" title="10 Nooby Mistakes Devs Often Make In Python" >}}




