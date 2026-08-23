# Brand Asset Distribution

`assets/` and `assets/exports/` are the only sources of shipped brand artwork. Consumer repositories must not edit exported copies directly.

Each consumer keeps a `.brand-assets.tsv` mapping from a canonical file in this repository to every shipped destination. Run this from the consumer root after updating the submodule:

```sh
design-system/scripts/brand-assets.sh sync . .brand-assets.tsv
```

CI runs the same command in `check` mode. It fails when the submodule or either base asset is missing or empty, when a mapped surface is missing, when any byte differs from its canonical export, or when a likely brand asset is tracked without a manifest entry.

All favicons, app icons, header logos, installer icons, social images, and future branded surfaces must be added here first, then mapped in the consumer manifest. Brand and design paths are CODEOWNED; repository branch protection must require Code Owner approval for the default branch.

## Consumer update automation

`.github/workflows/sync-consumers.yml` runs after each push to `main` and can also be started manually. It pins `macos`, `1132-Fixer-Windows`, `chrome`, and `website` to the triggering design-system commit, synchronizes their mapped assets, and opens or updates an `automation/design-system-sync` pull request. Review and consumer CI remain required before merge.

Cross-repository access uses a GitHub App. Install it on this repository and all four consumers with **Contents: read and write** and **Pull requests: read and write**, then configure:

- Repository variable `DESIGN_SYSTEM_SYNC_APP_CLIENT_ID`
- Repository secret `DESIGN_SYSTEM_SYNC_APP_PRIVATE_KEY`

The built-in `GITHUB_TOKEN` is intentionally not used because it is limited to this repository.
