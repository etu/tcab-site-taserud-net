---
title: Cyber Resilience Against Ransomware – Can You Protect Yourself?
date: "2023-12-30T13:30:00+01:00"
description: Exploring preventive measures against ransomware – how do you handle it?
ogImagePath: /blog/2023/12/cyber-resilience-against-ransomware/cyber-resilience-against-ransomware.png
tags: [Security, NixOS, ZFS]
---
![Image of an imaginary cyberattack](/blog/2023/12/cyber-resilience-against-ransomware/cyber-resilience-against-ransomware.png)

It's not uncommon to hear about major companies facing issues with
cyberattacks. Recently, incidents involving the [Swedish Church](https://www.svt.se/nyheter/inrikes/svenska-kyrkan-varnades-innan-it-attacken-tappte-inte-till-sakerhetshal)
and [Coop](https://www.svt.se/nyheter/inrikes/it-attacken-mot-coop-detta-har-hant)
have been in the spotlight, highlighting the prevalence of ransomware.

When dealing with a large IT system critical to operations, it's
crucial to carefully consider how to manage and plan for ransomware
attacks.

Whether it's a personal laptop, a terminal in a store, or a server
infrastructure for a major site, the principles remain the same.

Something that we're sure about is that bigger systems is harder to
secure then smaller systems - this isn't a good reason to not try
secure it though.

## We're not afraid – because we have a plan
We feel confident in our ability to handle a ransomware attack due to
a well-thought-out plan and preventive measures to minimize the
impact.

We follow a strategy to protect ourselves on multiple fronts and
ensure recovery in case the worst happens.

Contact us if you need help building your strategy or want advice and
assistance in enhancing your cyber resilience against
ransomware. [Contact us here](/en/#contact).

### Part 1: Minimize Exposure
The initial defense for any computer system is always to minimize the
exposure surface, reducing the risk of unauthorized access and
potential issues from the start.

This is achieved through a restrictive firewall, closed ports by
default, not allowing password logins for administrative functions
without keys or 2FA.

### Part 2: Disk Partitioning
The file system with the operating system is made as read-only as
possible. Additionally, other file systems are when possible marked
with `noexec` as the mount flag, preventing the execution of programs
from those file systems. However, scripts can still run as long as the
evaluated language is already installed on the system.

### Part 3: Built on NixOS
If, against the odds, something infiltrates and becomes part of the
operating system's partition, our security lies in building on
NixOS. This allows us, during the next system rollout, to discard
anything not part of the configuration, ensuring we only have what we
expect in the operating system.

### Part 4: Using ZFS Snapshots
We regularly take snapshots. As these snapshots are immutable once
created, we can always roll back to a previous snapshot on the
affected system if we detect any data has been compromised by
ransomware.

### Part 5: Synchronizing ZFS Snapshots
We synchronize snapshots from the production system to the backup
system, with the backup system executing this task. This ensures no
production system has access to the backup system to tamper with the
backup. It also allows us to lock down the backup system by only
running synchronization of backups and data integrity checks.

### Part 6: Built on NixOS
I know, this point again. However, if someone manages to gain a
foothold, such as infiltrating a computer's firmware, we're built on
NixOS. This means we can always acquire a new system to roll out the
same configuration and then restore the backup to it. This results in
a fresh installation with exactly the same configuration as before.

## How do you protect yourself and your business against ransomware?
Contact us if you need help building your strategy or want advice and
assistance in enhancing your cyber resilience against
ransomware. [Contact us here](/en/#contact).
