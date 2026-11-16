# Windsor Home: Claude Code context

Skills are in `.claude/skills/`. Claude Code, Cursor, and other tools find them automatically.

## Non-negotiable rules

1. **Code comments.** Describe current behavior and non-obvious constraints only. Do not cite issues, PRs, or ADRs. Do not narrate reasoning or change history. Keep each comment to one line of about 15 words. Match the comment density of the surrounding file.

2. **The Core boundary.** `home` authors only the apps a household runs. A common service (hardware discovery, an NFS driver, backups, a mesh VPN, UPS shutdown) belongs in `core`. Turn `core` capabilities on through context values. Do not redeclare a `core` facet or schema key.

3. **Schema keys.** Each app has its own top-level key, such as `jellyfin`. Do not add a namespace such as `addons`.

   Name each app facet `app-<name>`. A facet with no known prefix gets ordinal 0 and loses every merge.

4. **Facet authoring.** Follow `facet-author` for facet YAML structure, config layering, and `when:` and `requires:` conventions.

5. **Testing.** Follow `windsor-test` for the `.test.yaml` format. Run `task test` before you call work done.

6. **PRs.** Use `create-pr` to push and open or update a PR. Use `address-pr-feedback` to work through review comments and CI failures one finding at a time.

7. **Prose.** Write all prose in Simplified Technical English.

## Key commands

```
task test             # all tests
task test:blueprint   # blueprint facet tests only
task lint             # yamllint
```
