---
title: "Break the Virtual Environment"
date: 2024-12-17T12:12:47+08:00
tags: [ "python", "py-venv" ]
categories: [ "Posts"  ]
summary: "Making standalone tool from Python virtual environment."
draft: false
---
{{< lead >}}
*Few ways to run Python tool without* ***activating*** *Python virtual environment.*
{{< /lead >}}

After we [optimize main.py](/posts/optimize_main/), we may continue to make it a **standalone tool**.

And a lot of time, especially *Python >3.12*, we [create our project](/posts/python_project) with virtual environment `venv` module.
This will require us to *break the virtual environment* to make it a standalone tool without depending on sets of libraries/modules.

We have a few options: use `shebang` directly or use `OneFiler` to convert it to a single binary.


## Use `shebang`

This is a straight forward method, and it is suitable for using it at the same machine.

Instead of **activating** the virtual environment every time, we can directly call the Python interpreter within `venv` with `shebang`.
Simply add the `shebang` line at the top of Python script as below:

```python
#!/patch/to/venv/bin/python
```

Then, ensure the script has executable bit with `chmod +x main.py`.

Finally, we can just run the Python script `./main.py`.

## Use `OneFiler`

Using `OneFiler` simply means package the Python CLI application into a single binary using tools i

 - `PyInstaller`: *most common*
 - `Nuitka`: *more optimized, faster execution*
 - `shiv`: *for virtual environment-like bundle*


### PyInstaller

This is most common tool used due to its simplicity.

First, we need to setup `PyInstaller`.

```console
$ pip install pyinstaller --break-system-packages
$ pyinstaller --version
6.11.1
```

Then, we can create the binary with the following:

```console
$ pyinstaller --onefile --collect-all pyfiglet patch_tuesday.py
```

Finally, we can find the binary at <c2>dist/patch_tuesday</c2>.

### Nuitka

`Nuitka` converts Python script into a C-based binary, and has the advantage of better performance.

This is because it transpiles Python code into C code and then compiles it into a native executable file.
And to make the CLI app fully portable, use `--standalone` option, or the CLI app will depend on libraries that need to be installed.

First, let's setup `Nuitka` with the following: 

```console
$ pip install nuitka --break-system-packages
$ sudo apt install patchelf
```

Then, create the binary.

```console
$ python3 -m nuitka --onefile --standalone patch_tuesday.py
```

Finally, we can find the binary at <c2>patch_tuesday.bin</c2>.

### Shiv

`Shiv` can bundle our app into a zipapp than can run as a single file.
But it still depends on a compatible Python interpreter.
Thus, it is for a more portable Python-based package.

Here, we simply create a <c2>pyz of shiv</c2> *using* `shiv`!!

```console
$ mkdir standalone
$ cd standalone
$ python3 -m venv ../venv/standalone
$ source ../venv/standalone/bin/activate
(standalone) $ pip install shiv
(standalone) $ shiv -c shiv -o shiv shiv
(standalone) $ deactivate
$ ./shiv
You must supply PIP ARGS or --site-packages!

```

## Links 

 - [Patch_Tuesday Utils](https://myseq.blogspot.com/2022/07/patchtuesday-utils.html)

