---
layout: post
title: Auth0 BrandingTheme in pulumi
tags:
- infrastructure as code
- pulumi
- auth0
---

Updating to Universal Login on Auth0 and we need to access what pulumi calls the `BrandingTheme`, accessible in the console from "Branding > Universal Login > Customization Options". To import to your stack pulumi requires an id, and it turns out that id is `default`. Thanks to [karolis.mazukna on the Auth0 Community](https://community.auth0.com/t/branding-theme-configuration-via-terraform/102993).
