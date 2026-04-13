---
layout: default
title: Security Model
---
# Apache Storm Security Model

This document describes the security model of Apache Storm: the assumptions, trust boundaries, and guarantees the project makes with respect to security. It is intended to help operators deploy Storm securely and to help security researchers understand which behaviors are expected and which constitute genuine vulnerabilities.

For instructions on how to configure Storm's security features, see [Running Apache Storm Securely](https://storm.apache.org/releases/current/SECURITY.html).

## Reporting Security Vulnerabilities

The Apache Software Foundation takes a very active stance in eliminating security problems and denial of service attacks against its products. We strongly encourage people to report security problems privately using the security mailing list of the ASF Security Team before disclosing them in a public forum.

Please note that the security mailing list should only be used for reporting undisclosed security vulnerabilities and managing the process of fixing such vulnerabilities. We cannot accept regular bug reports or other queries at this address. All mail sent to this address that does not relate to an undisclosed security problem in our source code will be ignored.

Before reporting vulnerabilities, please read and understand this security model. Some potential issues that are valid for internet-facing applications are expected behavior in Storm's deployment model. Understanding the security model helps save time for both reporters and the Storm security team.

The private security mailing address is: [security@apache.org](mailto:security@apache.org)

## Fundamental Assumption: Trusted Deployment Environment

Apache Storm is designed to operate within trusted infrastructure. The cluster, including Nimbus, Supervisors, Workers, ZooKeeper, the Storm UI, and the Logviewer, is expected to run on a private network that is not directly accessible from the public internet. All components are intended to be accessed only by authorized operators and applications within the trusted network boundary.

This assumption underpins the entire security model. Many components do not include defenses against attacks that assume public internet exposure, because such exposure falls outside the intended deployment model.

## Trusted Configuration

The Storm configuration file (`storm.yaml`) is treated as a fully trusted input. An actor with write access to `storm.yaml` has effective administrative control over the entire Storm cluster, including the ability to reconfigure any component, change authentication and authorization settings, alter network bindings, and disable security features entirely.

Protecting `storm.yaml` through file system permissions and OS-level access controls is an operational responsibility. Modification of this file by an unauthorized party implies a deeper infrastructure compromise and is out of scope for Storm's runtime security protections.

This applies equally to other configuration files used by Storm, such as `multitenant-scheduler.yaml`, JAAS configuration files, and DRPC ACL files.

## User Types and Trust Levels

### Deployment Managers / Cluster Administrators

Deployment managers have the highest level of access and control. They install and configure Storm, manage `storm.yaml`, and make decisions about authentication, authorization, and network topology. They are trusted with full control of the cluster. Their responsibilities include securing the configuration files, setting up appropriate authentication mechanisms, restricting network access to cluster components, and configuring reverse proxies where necessary.

### Topology Submitters

Users who submit topologies execute arbitrary code on Storm workers. This model inherently trusts topology submitters; they can run any code within the context of the worker process. When multi-tenancy is required, the multi-tenant scheduler and `supervisor.run.worker.as.user` settings provide OS-level isolation, but topology submitters must still be authorized and trusted users.

Access to topology submission should be restricted to trusted users via Kerberos authentication and the `SimpleACLAuthorizer` (or equivalent), and further limited through `nimbus.users` and `nimbus.groups`.

### UI / API Users

Users who access the Storm UI or REST API can view cluster state and, depending on authorization, perform state-changing operations such as killing, activating, deactivating, or rebalancing topologies. Authenticated UI users with administrative privileges are trusted to perform these operations. The Storm UI does not guarantee protection against actions initiated by the authenticated user themselves.

## Storm UI, Logviewer, and DRPC HTTP

### Not Internet-Facing

The Storm UI (default port 8080), Logviewer (default port 8000), and DRPC HTTP endpoint are internal cluster services. They must not be exposed to the public internet. Operators should restrict access to these ports using firewall rules, limiting connections to trusted hosts within the cluster network.

### Reverse Proxy Recommended

For production deployments, these services should be placed behind a reverse proxy such as Apache httpd or nginx. The reverse proxy should provide TLS termination with current cipher suites, CSRF token validation or same-origin enforcement, security response headers (`X-Frame-Options`, `X-Content-Type-Options`, `Content-Security-Policy`, `Strict-Transport-Security`), rate limiting and request filtering, and centralized access logging.

### CORS and Same-Origin Policy

The Storm UI sets permissive CORS headers (`Access-Control-Allow-Origin: *`) by default. This is acceptable within the trusted network model where the UI is not internet-accessible. Operators who need stricter origin controls should configure them at the reverse proxy layer. This is documented behavior, not a vulnerability.

### CSRF Protection

The Storm UI REST API does not include built-in Cross-Site Request Forgery protection. Because the UI is designed to be accessible only from within a trusted network, CSRF risk is mitigated by network-level access controls. Operators requiring additional CSRF protection should configure it via their reverse proxy or a custom servlet filter through `ui.filter`. We do strive to follow HTTP semantics (using POST for state-changing operations) and welcome hardening reports in this area.

### Authentication

By default, the Storm UI has no authentication enabled. Operators should configure a servlet filter via `ui.filter` (for example, using Kerberos/SPNEGO via `AuthenticationFilter` from hadoop-auth) or rely on their reverse proxy for authentication. The Storm UI is not safe to operate without authentication if any untrusted user can reach it.

## Logs and Information Disclosure

Storm logs may contain sensitive information including stack traces with internal paths and class names, configuration values, topology data, and credentials or tokens if passed through tuple data. Logs are not intended to be safe for exposure to untrusted users. Access to the Logviewer should be restricted to authorized operators through the same mechanisms used for the UI (authentication filters, network restrictions, or reverse proxy controls). The `logs.users` and `logs.groups` settings provide additional access control for log viewing.

## Authentication and Authorization

Storm provides pluggable authentication via Kerberos/SASL and pluggable authorization via `SimpleACLAuthorizer`. By default, both are disabled. Operating Storm without authentication and authorization is only appropriate in fully trusted, single-tenant environments where all network access is controlled. In multi-tenant or security-sensitive deployments, operators must enable Kerberos authentication, configure `SimpleACLAuthorizer` on Nimbus, configure `ImpersonationAuthorizer` if impersonation is used, and enable BlobStore ACL validation (`storm.blobstore.acl.validation.enabled: true`).

Storm does not protect against brute-force password guessing or account enumeration. These protections should be provided at the infrastructure level (Kerberos KDC configuration, network controls, or reverse proxy rate limiting).

## Impersonation

Storm supports user impersonation (submitting requests on behalf of another user). Without `nimbus.impersonation.authorizer` configured, any authenticated user can impersonate any other user. When deploying a secured cluster, operators must always configure `nimbus.impersonation.authorizer` alongside `nimbus.authorizer`.

## Serialization

Storm uses Kryo for tuple serialization. The setting `topology.fall.back.on.java.serialization` must not be set to `true` in production, as Java native deserialization is vulnerable to arbitrary code execution from untrusted data. Storm defaults to requiring explicit class registration, which is the safe configuration.

## ZooKeeper Communication

When ZooKeeper SSL is enabled, hostname verification is disabled by default (`storm.zookeeper.ssl.hostnameVerification: false`). Without hostname verification, a man-in-the-middle attacker with any valid CA-signed certificate could intercept Storm-to-ZooKeeper communication. Production deployments should enable hostname verification.

## Network Encryption

Storm supports TLS for Thrift RPC communication (Nimbus, Supervisors) and Netty messaging (worker-to-worker) via mTLS. Enabling transport encryption is recommended for deployments where network traffic may traverse untrusted segments. The deprecated `BlowfishTupleSerializer` should not be used; it employs a 64-bit block cipher vulnerable to birthday attacks.

## Test Utilities in Production JARs

Storm includes certain classes intended for development and testing (such as `TestingFilter`) in its production JAR. These classes can be enabled through `storm.yaml` configuration. Since `storm.yaml` is a trusted input, the ability to enable test utilities through configuration is not a security vulnerability; it is equivalent to any other configuration change an administrator can make. However, operators should be aware that misconfiguring these settings can weaken security.

## What Is and Is Not a Security Vulnerability

Based on this security model, the following are **not** considered security vulnerabilities:

- Issues that require write access to `storm.yaml` or other trusted configuration files.
- Issues that require the Storm UI, Logviewer, or DRPC HTTP endpoints to be exposed to the public internet, contrary to deployment guidance.
- Permissive default CORS headers on internal services that are not intended to be internet-facing.
- Absence of built-in CSRF protection on internal services behind network-level access controls.
- Information disclosure through logs or API endpoints that are restricted to trusted network access.
- Enabling test utilities through configuration (which requires trusted configuration access).
- Version disclosure on internal endpoints.

The following **are** considered security vulnerabilities and should be reported:

- Authentication or authorization bypass that does not require trusted configuration access.
- Privilege escalation within the authorization model (for example, a non-admin user gaining admin capabilities without configuration changes).
- Remote code execution through untrusted input processed by Storm components (not topology code submitted by trusted users).
- Issues that compromise the security of a cluster deployed according to our documented recommendations.

We welcome security hardening suggestions even for areas outside the formal vulnerability scope. Reports that improve HTTP semantics compliance, add defense-in-depth measures, or improve the security posture of the default configuration are appreciated and will be addressed as hardening improvements.

## Questions About Known Security Problems

Questions about whether a vulnerability applies to your particular deployment, obtaining further information on a published vulnerability, or availability of patches and new releases should be addressed to the [dev mailing list](https://storm.apache.org/community.html).

