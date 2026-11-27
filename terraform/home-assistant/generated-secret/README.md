---
title: generated-secret
description: One generated secret for the Home Assistant facet.
---

Generates a 48-character alphanumeric secret. The facet runs one copy for
each of its secrets that the user leaves unset. A supplied value replaces
the generated one.

Set `rotation` to any new string to generate a replacement. A workload that
reads the secret as an environment variable needs a restart after the Secret
updates.
