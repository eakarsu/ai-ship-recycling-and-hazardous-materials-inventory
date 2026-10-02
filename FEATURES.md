# Ship Recycling and Hazardous Materials Inventory

Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.

## Implemented records

- **Recycling Vessel**: name, imo Number, flag, owner, gross Tonnage, survey Due At, status.
- **Vessel Component**: name, component Code, location, installed At, manufacturer, status.
- **Material Declaration**: title, material, substance, quantity Kg, source Reference, status.
- **Supplier Declaration**: title, supplier, declaration At, scope, evidence, status.
- **Hazard Sample**: title, sampled At, laboratory, substance, result Text, status.
- **Ihm Survey**: title, surveyor, surveyed At, scope, findings, next Due At, status.
- **Recycling Facility**: name, permit Number, country, capacity Tonnes, authorization Expiry, status.
- **Recycling Plan**: title, version, planned At, handling Plan, authorization Reference, status.
- **Recycling Transfer**: title, material, quantity Kg, transferred At, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Material declaration extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Supplier evidence gap review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- IHM discrepancy summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Survey preparation draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Recycling plan evidence review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Material handoff narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Hazardous material mass reconciliation: Balance inventoried additions and documented transfers for one material; facility authorization requires evidence.
- Recycling Vessel evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
