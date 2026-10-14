---
title: "Symbolic Links in Windows"
date: 2026-09-29T09:58:32+08:00
tags: [ "cmdline", "mklink", "ntfs" ]
categories: [ "Posts"  ]
summary: "Create Soft and Hard Symbolic Links in Windows."
draft: false
---
{{< lead >}}
*Microsoft calls it [**Reparse Points**](https://docs.microsoft.com/en-us/windows/win32/fileio/reparse-points).*
{{< /lead >}}

A symbolic link, aka SymLink, is a file-system object (file or directory) that points to another file system object.

The object being pointed to is called the **target**.


# Symbolic Links

There are three types of Symlinks supported in the **NTFS** file system: 
**hard links**, **junctions**, and **symbolic links**

> 


## Types of links in Windows

| Type | Command | Files | Folders | Cross-drive |
| :--- | :------ | :---: | :-----: | :---------: |
| Symbolic Link | `mklink` | ✅ | ✅ (/D) | ✅ |
| Hard Link | `mklink /H` | ✅ | ❌ | ❌ |
| Junction | `mklink /J` | ❌ | ✅ | ✅ (local drives) |

Microsoft documents these options in the mklink[^1] command.

[^1]: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink

By default, `mklink` creates soft link. 
And needs specific options for creating hard link and junction.
 

### Symbolic Link

**Symbolic Links** are soft links that are basically advanced shortcuts. 
It is a symbolic link to a local or remote *file, folder, or shares path*.

Symbolic links do support UNC paths (network paths that begin with \\\\).

When open a symbolic link, you will be *redirected* to the target source. 
Symbolic links will have a shortcut arrow icon on them. 


### Hard Link

**Hard Links** can only be created for *files*. 
Any changes to that file are instantly visible to applications that access it through the hard links that *reference* it. 

Hard links do not support UNC paths (network paths that begin with \\\\). 
And there will not have a shortcut arrow icon on them. 


### Junction

**Junctions** (aka Directory Junction) are soft links that can only be created to a local folder (directory) path. 

Same as hard link, **junction** points do not support UNC paths (network paths that begin with \\\\). 
There will have a shortcut arrow icon on junction point created.  


## Tips

 - Deleting the hard link, symbolic link, or junction point itself will not delete anything in the target (source) folder.  

 - But deleting anything in the link/junction or target (source) folder will delete it in both folders.  

```cmd
mklink [option] link target
```

Creating symbolic link can be helpful.
For example, I can move the "C:\Users\login\.ssh" directory to "D:\home\SSH".
And create a symbolic link at "C:\Users\login" pointing to "D:\home\SSH".


**Create Symbolic Link Pointing to File**

```cmd
mklink c:\Users\login\Desktop\cmdline.txt d:\home\cmdline.txt
```

**Symbolic Link Pointing to Directory**

```cmd
mklink /d c:\Users\login\.ssh \\fileserver\home\login\dotssh
```

**Create Hard Link Pointing to File**

```cmd
mklink /h c:\Users\login\Desktop\cmdline.txt c:\home\cmdline.txt
```

> Note that the link and target must be on the same drive.

**Create Junction Point to Directory**

```cmd
mklink /j c:\Users\login\.ssh d:\home\ssh
```

## Differences

 1. Between `mklink /d` and `mklink /j`.

    Both cmdline are creating a link to a folder. 
    The difference is `mklink /d` can support UNC.
    And `mklink /j` cannot.

 1. Between `mklink` and `mklink /h`.

    Both cmdline care creating a link to a file.
    The difference in `mklink /h` is cannot support cross-drive file.

    Another difference with `mklink /h` is, the data still remain accessible even the original (target) file is deleted.


**Symbolic link**:

```
target.txt -->  Data
link.txt   -->  target.txt
```  

After `del target.txt`:

```
target.txt --> ❌
link.txt   -->  ??? Broken link
```
  
**Hard link**:

```
target.txt ────┐
               ├---> Data
hardlink.txt ──┘
```  

After `del target.txt`:

```
target.txt ❌

hardlink.txt ---->  Data ✅
```

> Hard links can therefore be thought of as multiple names for the same file, rather than one file pointing at another file.


