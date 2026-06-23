# Demo Issues

These eight give good coverage across schema, headers, HTTP semantics, and request-routing/runtime behavior. They are also easy to explain quickly in a demo.

## 1. `allof-contradiction`

Two individually valid schemas become impossible when combined with `allOf`.
This is strong because spec may look fine structurally, but no real payload can satisfy it at runtime.

## 2. `impossible-min-properties`

Object requires more properties than it can legally contain because `minProperties` is too high while `additionalProperties: false`.
This shows a contract that is technically written down, but impossible for any client to satisfy.

## 3. `accept-response-content-type-conflict`

The `Accept` header says client wants one format, while response content only supports another.
This is a clean runtime example of content negotiation failure even though spec can still look valid.

## 4. `authorization-header-conflict`

The declared security scheme says one thing, while the `Authorization` header contract says something else.
This is notable because client cannot know what auth format to actually send on the wire.

## 5. `response-204-with-body`

The spec defines a response body for `204 No Content`.
This is simple, memorable, and clearly tied to HTTP runtime semantics rather than style.

## 6. `query-serialization-collision`

Two logically different query parameters serialize to the same wire-level key.
This is a strong demo case because request meaning becomes ambiguous even before the server handles business logic.

## 7. `oneof-duplicate-discriminator`

Two `oneOf` branches use the same discriminator value, so payload selection becomes ambiguous.
This is a good schema/runtime case because polymorphic decoding can break even when the spec still looks structurally acceptable.

## 8. `ambiguous-sibling-paths`

Two paths can match the same request, for example a literal path and a parameterized sibling path.
This is important because routing itself becomes ambiguous before business logic or validation even starts.

