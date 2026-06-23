# Final Linter Comparison Summary

Run date: `2026-06-23`

Legend:

- `hit` = tool caught target issue
- `partial` = tool raised nearby generic rule, not exact target issue
- `miss` = tool did not catch target issue

## Full Matrix

| Issue | Spectral | Redocly | Vacuum | Specmatic | Exact Catch / Notes |
| --- | --- | --- | --- | --- | --- |
| `accept-response-content-type-conflict` | miss | miss | miss | hit | `specmatic/accept-response-content-type-conflict` |
| `allof-contradiction` | miss | miss | miss | miss | no tool surfaced contradiction in this fixture |
| `ambiguous-interpolated-paths` | miss | miss | miss | miss | no tool flagged adjacent path params |
| `ambiguous-sibling-paths` | miss | miss | miss | miss | no tool flagged literal path shadowed by param path |
| `authorization-header-conflict` | miss | miss | miss | hit | `specmatic/security-property-redefined` |
| `bad-request-response-without-input` | miss | miss | miss | miss | no tool flagged pointless `400/422` |
| `content-type-header-conflict` | miss | miss | miss | hit | `specmatic/content-type-header-declared`, `specmatic/content-type-header-overrides-media-type` |
| `get-returns-204` | miss | miss | miss | miss | no tool objected to GET-only `204` |
| `impossible-min-properties` | miss | miss | miss | miss | no tool caught impossible object schema |
| `method-returns-201` | miss | miss | miss | miss | no tool objected to GET/PATCH/DELETE returning `201` |
| `misleading-required-query-object` | miss | miss | miss | miss | no tool flagged required object with all-optional fields |
| `missing-bad-request-response-with-input` | miss | partial | partial | partial | generic `operation-4xx-response` only |
| `oneof-duplicate-discriminator` | miss | miss | miss | miss | no tool flagged duplicate discriminator value |
| `oneof-identical-branches` | miss | miss | miss | miss | no tool flagged identical `oneOf` branches |
| `only-failure-statuses` | hit | hit | hit | hit | Spectral/Vacuum: `operation-success-response`, Redocly/Specmatic: `operation-2xx-response` |
| `query-serialization-collision` | miss | miss | miss | hit | `specmatic/query-param-collision` |
| `response-202-without-monitor-link` | miss | miss | miss | miss | no tool required async follow-up link |
| `response-204-with-body` | miss | miss | miss | miss | no tool objected to 204 carrying content |
| `response-206-without-content-range` | miss | miss | miss | miss | no tool required `Content-Range` |
| `response-304-with-body` | miss | miss | miss | miss | no tool objected to 304 carrying content |
| `head-response-body` | miss | miss | miss | miss | no tool objected to HEAD carrying content schema |
| `missing-retry-after-on-429` | miss | miss | miss | miss | no tool required `Retry-After` |
| `missing-www-authenticate-on-401` | miss | miss | miss | miss | no tool required `WWW-Authenticate` |
| `readonly-required-in-request` | miss | miss | miss | miss | no tool flagged impossible request shape |
| `security-scheme-missing-401-403` | miss | partial | partial | partial | generic missing `4xx` / `401` style rules only |
| `text-plain-object-schema` | miss | miss | miss | miss | no tool objected to object schema under `text/plain` |
| `writeonly-required-in-response` | miss | miss | miss | miss | no tool flagged impossible response shape |
| `overlapping-oneof-branches` | miss | miss | miss | miss | no tool flagged overlapping `oneOf` branches |
| `duplicate-path-template-param-names` | hit | hit | miss | hit | Spectral: `path-params`, Redocly/Specmatic: ambiguous/identical path rules |
| `path-template-param-mismatch` | hit | hit | hit | hit | all 4 caught missing/mismatched path params |

## Missed By Redocly, Spectral, Vacuum

These issues were **not caught by any of Redocly, Spectral, Vacuum** in current fixtures:

| Issue | Specmatic Result | Note |
| --- | --- | --- |
| `accept-response-content-type-conflict` | hit | Specmatic caught media-type mismatch via `Accept` header |
| `allof-contradiction` | miss | no tool caught this fixture |
| `ambiguous-interpolated-paths` | miss | no tool caught path ambiguity |
| `ambiguous-sibling-paths` | miss | no tool caught path shadowing |
| `authorization-header-conflict` | hit | Specmatic caught auth header vs security mismatch |
| `bad-request-response-without-input` | miss | no tool caught pointless `400/422` |
| `content-type-header-conflict` | hit | Specmatic caught `Content-Type` contradiction |
| `get-returns-204` | miss | no tool caught GET-only `204` |
| `impossible-min-properties` | miss | no tool caught impossible object |
| `method-returns-201` | miss | no tool caught non-create methods returning `201` |
| `misleading-required-query-object` | miss | no tool caught required object/query ambiguity |
| `oneof-duplicate-discriminator` | miss | no tool caught duplicate discriminator const |
| `oneof-identical-branches` | miss | no tool caught duplicate `oneOf` branches |
| `query-serialization-collision` | hit | Specmatic caught query serialization collision |
| `response-202-without-monitor-link` | miss | no tool caught missing async follow-up link |
| `response-204-with-body` | miss | no tool caught content on 204 |
| `response-206-without-content-range` | miss | no tool caught missing `Content-Range` |
| `response-304-with-body` | miss | no tool caught content on 304 |
| `head-response-body` | miss | no tool caught content on HEAD |
| `missing-retry-after-on-429` | miss | no tool caught missing `Retry-After` |
| `missing-www-authenticate-on-401` | miss | no tool caught missing `WWW-Authenticate` |
| `readonly-required-in-request` | miss | no tool caught impossible request shape |
| `text-plain-object-schema` | miss | no tool caught object under `text/plain` |
| `writeonly-required-in-response` | miss | no tool caught impossible response shape |
| `overlapping-oneof-branches` | miss | no tool caught overlapping `oneOf` branches |

## Partial-Only Catch Cases

These were not caught exactly, but some tools raised nearby generic rules:

| Issue | Tools | What They Raised |
| --- | --- | --- |
| `missing-bad-request-response-with-input` | Redocly, Vacuum, Specmatic | generic missing `4xx` response |
| `security-scheme-missing-401-403` | Redocly, Vacuum, Specmatic | generic missing `4xx` / missing `401` style rule, not exact `401 or 403` semantic |

## Raw Results

Per-tool logs live under `results/<scenario>/`.
