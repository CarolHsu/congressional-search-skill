# Policy Packet Template

Each year the priority bills and their stages change. Give the skill a packet in any readable format (PDF, DOCX, MD, plain text). The skill extracts what it needs, but a packet that follows this shape is read most reliably. Copy this file, fill it in, and pass it as `policy`.

```markdown
# <Organization> Legislative Packet — <Year / Conference>

Packet date: YYYY-MM-DD

## House priorities

### 1. <Issue name>
- Bill: H.R. ####  (<short title>)
- Packet status: <e.g. Introduced, referred to HFAC>
- Related vehicle (optional): <e.g. language in FY27 NDAA, H.R. ####>
- Our ask: <what we want members to do>
- Key facts:
  - ...
  - ...
- Notes (optional): <sensitivities, lead sponsors, why it is a priority this year>

### 2. <Issue name>
...

## Senate priorities

### 1. <Issue name>
- Bill: S. ####
...
```

Tips:
- Always include the bill number and chamber. Entries without them are flagged as ambiguous.
- Packet status is treated as a starting point; the skill re-verifies on Congress.gov and reports differences.
- Mark priorities that are only worth raising with certain members (e.g. "committee members only") in Notes.
- A FAQ file (likely objections and answers) is passed separately as `faq`.
- Keep one folder per year (for example `packets/2026/`) so earlier years never get mixed in.
