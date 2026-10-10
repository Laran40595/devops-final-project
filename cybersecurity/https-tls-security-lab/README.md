# HTTPS and TLS Security Assessment Lab

## Overview
A hands-on cybersecurity practical demonstrating HTTPS configuration,
TLS protocol testing, certificate validation, and HTTP security headers
using Kali Linux, Apache HTTP Server, and OpenSSL.

## Objectives
- Configure HTTPS on a local Apache server.
- Generate and inspect a self-signed TLS certificate.
- Test TLS 1.2 and TLS 1.3 connections.
- Verify that TLS 1.0 and TLS 1.1 handshakes are rejected.
- Validate a certificate using OpenSSL.
- Inspect HTTP security headers.

## Lab Environment
- Operating system: Kali Linux
- Web server: Apache HTTP Server
- Testing tool: OpenSSL
- Target: localhost (controlled local lab)
- Certificate: Self-signed certificate for localhost

## Results

| Test | Result |
|---|---|
| TLS 1.3 | Successful |
| TLS 1.2 | Successful |
| TLS 1.1 | Handshake not completed |
| TLS 1.0 | Handshake not completed |
| Certificate validation | Successful when explicitly trusted |
| Content Security Policy | Observed |
| X-Content-Type-Options | Observed |
| Referrer-Policy | Observed |

## TLS Configuration

The Apache SSL configuration contained:

    SSLProtocol all -SSLv2 -SSLv3 -TLSv1 -TLSv1.1

This disables SSLv2, SSLv3, TLS 1.0, and TLS 1.1.

## Verification Commands

Test TLS 1.3:

    openssl s_client -connect localhost:443 \
      -servername localhost -tls1_3 \
      -CAfile /etc/apache2/ssl-lab/lab.crt \
      -verify_return_error </dev/null

Test TLS 1.2:

    openssl s_client -connect localhost:443 \
      -servername localhost -tls1_2 \
      -CAfile /etc/apache2/ssl-lab/lab.crt \
      -verify_return_error </dev/null

Inspect the certificate:

    openssl x509 -in /etc/apache2/ssl-lab/lab.crt \
      -noout -subject -issuer -dates -ext subjectAltName

Check the Apache configuration:

    sudo apache2ctl configtest

## Security Headers
The lab verified these response headers:
- Content-Security-Policy
- X-Content-Type-Options: nosniff
- Referrer-Policy: strict-origin-when-cross-origin

## Conclusion
The local server successfully negotiated TLS 1.2 and TLS 1.3.
Attempts to negotiate TLS 1.0 and TLS 1.1 did not complete.
Certificate validation succeeded when the lab certificate was
explicitly provided as a trusted certificate.

These results apply to the local lab only. They do not establish
the security status of any unrelated public server.

## Evidence
Screenshots and supporting practical evidence belong in the
evidence/ directory.

## Author
Great Mike Osagie

## Disclaimer
This project is intended for educational purposes and authorized
security testing in controlled environments.
