# Video Proposal: Specmatic Linter and Execution-Readiness

## Objective

Create a video that positions Specmatic Linter as a tool that helps teams check whether an OpenAPI spec is not only structurally valid, but also execution-ready.

The proposal should help us explain why this matters, what differentiates Specmatic, and which examples best support that narrative.

## Core Positioning

Traditional linters such as Spectral, Redocly, and Vacuum are strong at structural validity, style, governance, and overall OpenAPI quality.

That is useful, but it does not fully answer a different question:

**Will this spec behave coherently at runtime when used for mocks, contract tests, request/response validation, routing, and content negotiation?**

Specmatic Linter’s positioning should be that it adds this execution-readiness lens.

## Key Narrative

A spec can be structurally valid and still be unsafe, ambiguous, or misleading at runtime.

Examples:

- request and response media types may contradict declared headers
- authentication definitions may conflict with actual wire-level header expectations
- query parameters may serialize into ambiguous wire format
- HTTP semantics may be inconsistent with response definitions
- request or response schemas may be technically legal but impossible or misleading in practice

This is the gap we want to highlight.

## Important Clarification

We should not frame this as “traditional linters cannot do runtime checks.”

More accurate and stronger framing:

- traditional linters **can** be extended to catch many runtime-oriented issues
- but that usually requires **custom rule authoring, maintenance, and tuning**
- Specmatic Linter aims to provide many such checks as **built-in execution-readiness rules**

This is an important differentiator.

## Why Specmatic Is Credible Here

Specmatic’s execution-readiness rules are not arbitrary style opinions.

They come from Specmatic’s practical experience of:

- generating mocks from OpenAPI specs
- validating requests and responses against OpenAPI contracts
- running contract tests directly from OpenAPI specs

That gives Specmatic a strong basis for identifying issues that matter at runtime, even when a spec still looks acceptable to a traditional linter.

## Adoption and Migration Angle

Another important point for the video:

- execution-readiness is **not forced by default**
- teams can **opt into** these rules
- this makes it easier for teams to move from their current linting setup to Specmatic Linter without disruption

This should be positioned as a migration-friendly advantage:

- teams do not need to replace their linting culture overnight
- they can start with familiar validation expectations
- then progressively enable runtime-aware checks where needed

## Messaging We Should Land

These are the main arguments the video should communicate:

1. Structural validity is necessary, but not sufficient.
2. Runtime consistency is a separate and important concern.
3. Traditional linters usually optimize for structure, style, and governance.
4. Runtime-oriented checks often require custom rules in traditional linters.
5. Specmatic Linter brings execution-readiness checks as built-in capability.
6. Those built-in checks are informed by Specmatic’s expertise in mocks and contract testing.
7. Teams can opt into execution-readiness rules gradually.

## Best Demo Examples

The examples we choose should be easy to understand, easy to explain, and clearly tied to runtime behavior.

### Strongest examples

1. `Accept` header contradicts response content type  
   Runtime impact: content negotiation fails.

2. `Content-Type` header contradicts request body media type  
   Runtime impact: client and server disagree on payload format.

3. Authorization header contract contradicts security scheme  
   Runtime impact: client cannot know correct auth wire format.

4. Query serialization collision  
   Runtime impact: two distinct logical parameters collapse into same wire-level representation.

### Additional strong examples

5. `204` / `304` / `HEAD` with response body  
   Runtime impact: spec describes body where runtime semantics say there should not be one.

6. `202 Accepted` without follow-up mechanism  
   Runtime impact: async workflow is incomplete for client.

7. `401` without `WWW-Authenticate`, or `429` without `Retry-After`  
   Runtime impact: client cannot respond correctly to failure or throttling.

8. `readOnly` required in request / `writeOnly` required in response  
   Runtime impact: contract becomes impossible or misleading for clients.

## Suggested Emphasis

If we want sharp and credible positioning, emphasis should be:

- not “Specmatic replaces traditional linters”
- but “Specmatic adds execution-readiness checks that traditional linters do not usually provide out of the box”

That framing is more accurate and more persuasive.

## Final Takeaway

The main takeaway we want audience to leave with is:

**Traditional linters help ensure an OpenAPI spec is well-formed and well-governed. Specmatic Linter helps ensure that the same spec is execution-ready for mocks, tests, and runtime contract consistency.**

Short version:

**Traditional linters help you write good OpenAPI. Specmatic Linter helps you write OpenAPI that is execution-ready.**
