---
title: "Well-known URI"
date: 2026-06-09T22:22:30+08:00
tags: [ "rfc", "uri", "wellknown" ]
categories: [ "Posts"  ]
summary: "A reserved path to find protocol-specific information."
draft: false
---
{{< lead >}}
*Think of it as a* **consistant notice board at a known address**.
{{< /lead >}}

Recently, while exploring OIDC and Oauth at work, I stumbled upon a URL like this:

```
https://example.org/.well-known/security.txt
```

Immediately, the `well-known` and `security.txt` URIs grabbed my attention.
So in this blog, I'll demystify his concept, RFC 8615, and explore some examples.

## What is `.well-known`?

A **well-known URI** or `/.well-known/` is a standardized, predictable location that allows client to find protocol-specific information or services without needing custom knownledge of the server's URL structure.

Well-known URIs use the reserved path: `/.well-known/`. 
Then, followed by a **registered identifier**, 
and the full path will be `https://example.org/.well-known/<identifier>`

The `/.well-known/` namespace is standardized by **RFC 8615** which reserves it for well-known locations.

## But Why?

With `well-known`, it provides a **standard location and interoperability** across the web.

Instead of asking, "Where does this server publish its security file or identity configuration?", a client already knows where to look.

This isn't a random folder.
It is part of the Internet architecture that helps everything goes smoothly.

For example:

```
https://example.org/.well-known/acme-challenge/...
https://example.org/.well-known/openid-configuration
https://example.org/.well-known/security.txt
```

## Well-Known Identifier

There is an official IANA Well-Known URI Registry that containing `well-known` **identfier**:

| Well-known Identifier | Example |
| :-------------------- | :------ |
| `acme-challenge` | `/.well-known/acme-challenge/...` |
| `change-password` | `/.well-known/change-password` |
| `api-catalog` | `/.well-known/api-catalog` |
| `security.txt` | `/.well-known/security.txt` |
 | `openid-configuration` | `/.well-known/openid-configuration` |

Each of the identifier has a spcification describing what they mean and how clients should use the.

### ACME certificates

One of a great example on using `/.well-known/` is automated TLS certificate validation.

The registered `acme-challenge` well-known identifier exists for the ACME[^1] protocol.

{{< alert >}}
Just think of **ACME challenge** as a **proof-of-control test** that a Certificate Authority (CA) gives you before it will issue a TLS certificate.
{{< /alert >}}

First, Let's Encrypt (CA) will send the challenge to <https://example.org/.well-known/acme-challenge/<random-token> via HTTP `GET` request.

> *This is equal to the CA is asking, "Can you prove me that you are controlling `example.org`?"*

Then, our web server will send back the challenge response to Let's Encrypt (CA), to proof the domain ownership is validated.


### OpenID Connect

An OpenID Connect client needs several pieces of information before connecting to a identity server.

Rather than manually configuring everything, the client can retrieve discovery metadata from a defined well-known endpoint: `https://example.org/.well-known/openid-configuration`

The response is JSON that tells the client where the important identity enpoints are.
And this enables **automatic discovery**.

Here's an example of response in JSON:

```json {}
  {
   "issuer": "https://server.example.com",
   "authorization_endpoint": "https://server.example.com/connect/authorize",
   "token_endpoint": "https://server.example.com/connect/token",
   "token_endpoint_auth_methods_supported": ["client_secret_basic", "private_key_jwt"],
   "token_endpoint_auth_signing_alg_values_supported": ["RS256", "ES256"],
   "userinfo_endpoint": "https://server.example.com/connect/userinfo", 
   "check_session_iframe": "https://server.example.com/connect/check_session", 
   "end_session_endpoint": "https://server.example.com/connect/end_session",
   "jwks_uri": "https://server.example.com/jwks.json",
   "registration_endpoint": "https://server.example.com/connect/register",
   "scopes_supported": ["openid", "profile", "email", "address", "phone", "offline_access"],
   "response_types_supported": ["code", "code id_token", "id_token", "id_token token"],
   "acr_values_supported": ["urn:mace:incommon:iap:silver", "urn:mace:incommon:iap:bronze"],
   "subject_types_supported": ["public", "pairwise"],
   "userinfo_signing_alg_values_supported": ["RS256", "ES256", "HS256"],
   "userinfo_encryption_alg_values_supported": ["RSA-OAEP-256", "A128KW"],
   "userinfo_encryption_enc_values_supported": ["A128CBC-HS256", "A128GCM"],
   "id_token_signing_alg_values_supported": ["RS256", "ES256", "HS256"],
   "id_token_encryption_alg_values_supported": ["RSA-OAEP-256", "A128KW"],
   "id_token_encryption_enc_values_supported": ["A128CBC-HS256", "A128GCM"],
   "request_object_signing_alg_values_supported": ["none", "RS256", "ES256"],
   "display_values_supported": ["page", "popup"],
   "claim_types_supported": ["normal", "distributed"],
   "claims_supported":
     ["sub", "iss", "auth_time", "acr",
      "name", "given_name", "family_name", "nickname",
      "profile", "picture", "website",
      "email", "email_verified", "locale", "zoneinfo",
      "http://example.info/claims/groups"],
   "claims_parameter_supported": true,
   "service_documentation": "http://server.example.com/connect/service_documentation.html",
   "ui_locales_supported": ["en-US", "en-GB", "en-CA", "fr-FR", "fr-CA"]
  }
```

Check out at <https://openid.net/specs/openid-connect-discovery-1_0.html> for more details.


### security.txt

This `security.txt` identifier can tell security researchers how to report vulnerabilities.

This is like a **machine-readable vulnerability disclosure contact information**.

Example:

```
# See https://securitytxt.org/ 

Contact: mailto:security@example.org
Contact: mailto:vulnerability@example.org

Encryption: https://example.org/pgp-key.txt
Policy: https://example.org/support/vulnerability-response-policy

Canonical: https://example.org/.well-known/security.txt
Expires: 2025-10-10T08:00:00.000Z

-----
# Last modified: September 02, 2025
```


## Links 

 - Wikipedia [Well-known URI](https://en.wikipedia.org/wiki/Well-known_URI)
 - IANA [Well-Known URIs](https://www.iana.org/assignments/well-known-uris) / [RFC 8615](https://www.rfc-editor.org/info/rfc8615/)
 - [Understanding .well-known URIs](https://bharathvaj.com/posts/understanding-well-known-uris-rfc-8615/)



