---
title: "Backup Stategy"
date: 2026-04-11T15:22:22+08:00
tags: [ "backup", "bash", "proxmox", "strategy" ]
categories: [ "Posts"  ]
summary: "The bulletproof backup in Proxmox: Trigger on Shutdown"
authors:
  - "xx"
draft: false
---
{{< lead >}}
We use **"Defer and Detach"** strategy to achieve the **trigger-on-shutdown** goal on backup.
{{< /lead >}}

I run Windows 11 Pro as virtual machine in Proxmox host.
Because the Windows OS has many important files, I need a backup solution. 
Especially after I experience the BitLocker locks down my VM.

## Strategy

I need a backup strategy that will auto-backup my VM **only when I shut down it**.
And I need to keep multiple backup copies while not to causing my `local` disk full.

Strategy:

 - Auto-backup my VM after shutdown.
 - Keep multiple copies at daily 2 and weekly 2 as Prune settings.

My challenges:

 - Existing `local` disk is 67% full and limited to 100GB.
 - Once it reaches 100%, my Proxmox host will crash.
 - Keep multiple backup copies and each is at estiamted 41GB (after compression).

> Luckily, my `local-lvm` partition is at 60% usage (700GB free).

## Plan

> I'll showoff the "magic" of **LVM-Thin** without reboot the host.

Here's the plan to *expand my `local` storage*:

 1. Create a "Dummy Drive" for backup using `local-lvm` partition.

 1. Expose the "Dummy Drive" to Proxmox for future backup.

 1. Configure the backup retention at `Datacenter` level.


{{< alert icon="heart" >}}
> **Advantages**: 
> This plan has **zero risk**, because there is no touching on OS partition or moving system boundaries.
> It is flexible by leveraging the 1.8TB of space in `local-lvm` partition.
> Best part is, no reboot needed.
{{< /alert >}}

### Preparation Steps

First, create the volume at the "thin" volume named `backup-disk`.

```console
% lvcreate -V 200G --thinpool pve/data --name backup-disk
```

Format it to **EXT4**.
Create the Mount Point and mount it.

```console
% mkfs.ext4 /dev/pve/backup-disk
% mkdir -p /mnt/pve-backups
% mount /dev/pve/backup-disk /mnt/pve-backups
% echo '/dev/pve/backup-disk /mnt/pve-backups ext4 defaults 0 2' >> /etc/fstab
```

Next, expose it to Proxmox.

From **Proxmox Web UI**:

 1. **Datacenter > Storage > Add > Directory**

 1. **ID:** `Backups`

 1. **Directory:** `/mnt/pve-backups`

 1. **Content:** `Backup`

 1. **Nodes:** `proxmox`

 1. Click **Add**.

Last, I move existing backups to the new location.

```console
% mkdir -p /mnt/pve-backups/dump
% sudo mv /var/lib/vz/dump/* /mnt/pve-backups/dump
% ln -lh /mnt/pve-backups/dump
```

### Update Backup Retention

 1. Goto **Datacenter > Backup**

 1. Disable any existing **Backup Jobs**

 1. Goto **Datacenter > Storage**

 1. Select **Backups** ID (created earlier)

 1. Click **Backup Retention** tab

 1. **Keep Daily**: 2

 1. **Keep Weekly**: 2

 1. Click **OK**.

### The "Shutdown-Triggered" Backup (Hook Script)

My goal is to tell Proxmox to run a script whenever a VM changes state (to shutdown).
And I have gone some lessons learn before reaching this final version.

This "Backup on Shutdown" hook script will tells Proxmox:
*Whenever this VM stops, run a backup to the new `Backups` storage.*

The strategy we use in our script here is called **"Defer and Detach"**.

---

First, intall with `sudo apt install at`.

Then, at the Proxmox host, create a file `/var/lib/vz/snippets/backup-on-shutdown.sh`.

```bash
#!/bin/bash

VMID=$1
PHASE=$2
FLAG_FILE="/tmp/backup_running_$VMID"

if [ "$PHASE" == "post-stop" ]; then
    # If flag exists, this stop was caused by the backup finishing
    if [ -f "$FLAG_FILE" ]; then
        rm "$FLAG_FILE"
        exit 0
    fi

    # Create flag and schedule the backup 1 minute out
    touch "$FLAG_FILE"
    echo "qm unlock $VMID && vzdump $VMID --storage Backups --mode snapshot" | at now + 1 minute
    
    exit 0
fi
exit 0
```

Proxmox locks the VM configuration during shutdown.
The solution is to use the `at` command to schedule the backup **one minute into the future**, allowing the host to finish its housekeeping first.

Before we attach it to VM, we need to make it executable: 
`chmod +x /var/lib/vz/snippets/backup-on-shutdown.sh`

Last, we will attach it to VM (ID:100) with:

```console
% qm set 100 --hookscript local:snippets/backup-on-shutdown.sh
```

## 🎓 Lessons Learned: The Road to Success

 1. **Race Conditions:** Proxmox holds a system lock during shutdown. Attempting to backup immediately causes a "Lock Timeout."

 1. **The Infinite Loop:** The backup process sends a "Stop" signal when it finishes. Without a Flag File, the script would trigger a recursive loop of endless backups.

 1. **Process Detachment:** Using the `at` command is essential. It completely detaches the backup from the Proxmox process tree, letting the host "clean the room" before the backup starts.

**Retention Tip:** Use Daily 2 / Weekly 2 prune settings to provide a 3-week safety net while keeping your backup partition lean.


