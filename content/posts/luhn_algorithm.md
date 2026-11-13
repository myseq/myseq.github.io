---
title: "Luhn Algorithm"
date: 2026-11-13T13:26:40+08:00
tags: [ "algorithm", "creditcard", "luhn" ]
categories: [ "Posts"  ]
summary: "Roughly 90% of numbers fail Luhn."
draft: false
---
{{< lead >}}
*Very broadly, a mod-N checksum partitions results into N possible remainder classes.*

*If we used mod 5, the possible remainders are:* `0,1,2,3,4`

*If we used mod 3, the possible remainders are:* `0,1,2`
{{< /lead >}}

## What's It?

The **Luhn algorithm**, sometimes called the **mod-10 algorithm**.
It is a simple checksum method used to detect mistakes in identification numbers.

It is commonly associated with credit and debit card numbers.

> Luhn does not encrypt or secure a number. 
> It only checks whether the number is mathematically well-formed.

## How It Works?




```
Input:                 5     6     7     8
Position from right:   4     3     2     1
                       │           │     │
                     double      double  check digit
                       ↓           ↓
Calculation:          5×2    6    7×2    8
                       ↓           ↓
                      10          14
                       ↓           ↓
                    10-9        14-9
                       ↓           ↓
Result:                1  +  6  +  5  +  8
                       └──────┬──────────┘
                              ↓
                         Total = 20
                              ↓
                      20 mod 10 = 0
                              ↓
                             ✅
```

So **5678 is Luhn-valid**.

## Luhn in Python

```
def isValid(number: str) -> bool:
    if not number or not number.isdigit():
        return False

    total = 0

    for position, char in enumerate(reversed(number)):
        digit = int(char)

        # Check digit is position 0.
        # Double positions 1, 3, 5, ...
        if position % 2 == 1:
            digit *= 2
            if digit > 9:
                digit -= 9

        total += digit

    return total % 10 == 0
```


```
print(isValid("9985"))   # True
print(isValid("9986"))   # False
```

### More Compact

Here is a compact and clever implementation of Luhn validation.

```python {lineNos=inline}
def luhn(n: str) -> bool:
    if not n or not n.isdigit():
        return False

    r = [int(ch) for ch in n][::-1]

    return (
        sum(r[0::2]) +
        sum(sum(divmod(d * 2, 10)) for d in r[1::2])
    ) % 10 == 0
```

**Reverse the digits**

```python {title="Python: Line 5"}
r = [int(ch) for ch in str(n)][::-1]
```

This is convenient because Luhn works *from the right*.

**Digits that are not doubled**

```python {title="Python: Line 8"}
sum(r[0::2])
```

`[0::2]` means: Start at index 0, then take every second element.
And `sum()` them up.

**Digits that are doubled**

```python {title="Python: Line 9"}
for d in r[1::2]
```

This is to select the second position (for double up).

```python {title="Python: Line 9"}
sum(divmod(d * 2, 10))
```

This is to double up and return the division with mod values.

## Credit Card

There is a **payment processor's officially documented test card number**.

VISA test card numbers: `4242 4242 4242 4242`

It is **Luhn-valid**.

For *Luhn validation*, let's mark the digits to double.

```
Card:       4  2  4  2   4  2  4  2   4  2  4  2   4  2  4  2
            ↑     ↑      ↑     ↑      ↑     ↑      ↑     ↑
           ×2    ×2     ×2    ×2     ×2    ×2     ×2    ×2
```

Then, apply the Luhn transformation:

```
Original:   4  2  4  2   4  2  4  2   4  2  4  2   4  2  4  2
            ↓     ↓      ↓     ↓      ↓     ↓      ↓     ↓
Double:     8     8      8     8      8     8      8     8

Result:     8  2  8  2   8  2  8  2   8  2  8  2   8  2  8  2
```

Follow by add everything together.

```
(8 × 8) + (2 × 8)

= 64 + 16

= 80
```

And apply Mod-10:

```
80 mod 10 = 0
```

Therefore, we can conclude that:

```
4242 4242 4242 4242
        │
        ▼
Luhn total = 80
        │
        ▼
  80 mod 10 = 0
        │
        ▼
       ✅
    Luhn-valid
```

```python
isValid("4242424242424242") # True
```

Based on this, we can easily find the valid pattern for: `1818`, `2626`, `3434`, `4242`.

Each pair contributes 10 under the Luhn calculation, making the pattern especially easy to explain.

## Other Use Cases

Luhn is used for other identifiers where *catching data-entry mistakes cheaply* is useful.

A notable example is the **IMEI** used to identify mobile devices. 
A standard IMEI has a check digit calculated using Luhn, helping detect transcription errors.

Another example is the US **National Provider Identifier (NPI)** used for healthcare providers. 
Its check digit is also based on Luhn, although its calculation includes a specific prefix convention.


## Links

 - [Luhn Algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm)

