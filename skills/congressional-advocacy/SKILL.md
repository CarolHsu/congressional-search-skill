---
name: congressional-advocacy
description: Prepare a Capitol Hill advocacy meeting brief for a specific U.S. Representative or Senator. Researches the member's current committees, caucuses, and Taiwan/China record, evaluates every priority bill in the supplied legislative packet against live Congress.gov status, picks the best three issues, and drafts concrete CTAs, talking points, objections, a meeting plan, and a follow-up tracker. Use when the user names a member of Congress and wants meeting prep, bill selection, or a CTA strategy (e.g. FAPA National Advocacy Conference), or says "advocacy brief", "Hill meeting prep", "which bills should we raise with Rep./Sen. X".
---

# Congressional Advocacy Strategy

Produce a meeting-prep brief for ONE member of Congress. The goal is not to summarize the member or the bills. The goal is to answer:

> Given who this member is, what they care about, what they have already done, their committee/caucus positions, and where each priority currently stands legislatively, which THREE issues should we discuss, and what is the strongest concrete Call to Action (CTA) for each?

## Parameters

Collect these from the user's message. Ask only for what is missing and required; apply defaults silently for the rest.

| Parameter | Required | Default | Notes |
|---|---|---|---|
| `member` | yes | — | Name of the Representative or Senator. If ambiguous (shared surname, former member), confirm state/district. Chamber is derived from the member. |
| `policy` | yes | — | The year's legislative packet: file path(s), pasted text, or a folder. This defines the issue list and the policy baseline. See "Policy input" below. |
| `faq` | no | none | Meeting FAQ / Q&A file. Baseline for the objections section. If absent, write answers from verified facts and mark them RECOMMENDATION. |
| `audience` | no | `staff` | `staff` (meeting is with a legislative assistant / staffer) or `member` (meeting is with the Member in person). Changes sections 7, 10, 11. See "Audience mode". |
| `delegation` | no | unknown | Who is attending: names, home states/districts, employers, universities, industries. Used for relationship hooks. Never invent. |
| `meeting_date` | no | unknown | Used for the status-check date and the final recheck list. |
| `language` | no | English | Output language. Keep bill numbers, names, and citations in English regardless. |

If the user gives a member but no policy, ask for the packet. Do NOT fall back to remembered or previous-year issues: the issue list changes every year and a stale list produces wrong advice. Proceed without a packet only if the user explicitly says so; then say clearly at the top that the issue universe was inferred from the web and is not the organization's official agenda.

## Policy input

The packet is the policy baseline, not the source of truth for current status.

1. Read every file provided (PDF, DOCX, MD, TXT). If given a folder, read all of it.
2. Extract the issue list: for each priority, the issue name, bill number(s) and chamber, the packet's stated status, the packet's stated ask, and any key facts or talking points. Print this extracted list back as a compact table before researching, so the user can catch misreads.
3. Flag packet entries that are ambiguous (no bill number, wrong chamber for this member, "TBD").
4. Use only the chamber-relevant issues: House priorities for a Representative, Senate priorities for a Senator. If a priority has only a companion in the other chamber, note it but evaluate it under the member's own chamber's vehicle.
5. Treat the packet's status as PACKET-DERIVED. Always re-verify status on Congress.gov. If they disagree, say so explicitly; the verified status wins.

See `references/policy-packet-template.md` for the layout teammates can use to prepare a packet for a new year.

## Audience mode

The default is `staff`, because most Hill meetings are with a legislative assistant, not the Member.

**`staff` mode (default)**
- Do NOT build the strategy around small talk with the Member. Rapport matters much less than being easy to act on.
- Relationship hooks (section 7): identify (a) which staffer likely covers foreign affairs / defense / trade / tech (find on the member's website, LegiStorm-style public listings, or committee staff pages; mark as NEEDS RECHECK, do not guess names), (b) one authentic constituent or local tie to establish why the office should take the meeting, not as a rapport exercise. Keep it to one sentence of opening.
- Reframe every CTA as something the staffer can carry back: "recommend the Member cosponsor H.R.XXXX", plus the mechanics (who to contact to add the cosponsorship, any sign-on deadline).
- Prefer asks that are low-friction for staff: a one-page leave-behind, bill text, existing cosponsor list, a Dear Colleague link, a named lead office to contact.
- Meeting plan: assume 15–20 minutes, possibly less. Shorter opening, ask-first structure, more time for staff questions and process.
- Intelligence objectives get heavier weight: the cosponsorship process, who decides, what the Member's stated concerns are, timelines.
- Commitments are "staff will recommend and report back by DATE", not Member commitments. Track them as such; do not record them as YES.

**`member` mode**
- Use the full original framing: personal/district/professional connections, who in the delegation introduces the group, the connection → interest → Taiwan → bill → CTA bridge.
- CTAs are phrased directly to the Member.

In both modes the CTA target is the same member action (cosponsor, vote, sign letter). Only framing, mechanics, and tracking change.

## Core principle

MEMBER FIT decides WHICH 3 issues. LEGISLATIVE STATUS + MEMBER POSITION decide WHAT we ask. PERSONAL / DISTRICT / POLICY CONNECTIONS decide HOW we frame it. The objective is the strongest realistic, measurable commitment.

When an active standalone bill exists and the member is not a cosponsor, COSPONSORSHIP is normally the primary CTA, even if the policy also rides on a more advanced vehicle. Structure it as PRIMARY: cosponsor the standalone bill; SECONDARY: support/preserve the policy in the advanced vehicle. Explain any exception explicitly (obsolete bill, superseded text, leadership moved to another vehicle, imminent vote, member's no-cosponsor rule).

The detailed scoring weights, the status → CTA matrix, and the CTA hierarchy are in `references/cta-framework.md`. Read it before selecting issues.

## Workflow

1. **Parse parameters** and echo them back in one line (member, audience, packet files, date).
2. **Extract the issue list** from the packet (see Policy input).
3. **Research the member** (verified sources only): committees and subcommittees, leadership roles, caucuses, Taiwan Caucus membership, background, district industries, Taiwan/China votes, sponsored and cosponsored Taiwan legislation, statements, travel. Prioritize recent behavior.
4. **Verify every in-scope bill** on Congress.gov: current status and latest action, committee referral, whether the member sits on that committee, sponsor/cosponsor status (check the actual cosponsor list, not one search snippet), relevant roll-call votes, whether the language is in a more advanced vehicle (NDAA, appropriations, a package).
5. **Score and select** the three issues per `references/cta-framework.md`; classify the member A–E.
6. **Write the brief** in the structure from `references/output-structure.md`.
7. **Self-check** before delivering: every status/cosponsor/committee/vote claim has an inline link; no inference is stated as fact; each of the three issues has a PRIMARY CTA that is concrete and measurable; the "STATUS CHECKED" date is today's date.

## Source standard (critical)

Label findings: VERIFIED, PACKET-DERIVED, INFERENCE, RECOMMENDATION, NEEDS RECHECK.

Source priority: (1) Congress.gov and official House/Senate records, (2) official committee sites, (3) the member's official site, (4) official roll-call records (clerk.house.gov, senate.gov), (5) GovInfo, (6) reputable secondary sources only when primary evidence is unavailable.

For bill status, referral, committee membership, sponsorship/cosponsorship, recorded votes, and caucus membership: do not guess. Do not infer non-cosponsorship from a search result that merely failed to list the member; open the cosponsor list. If you cannot verify, write NEEDS RECHECK and say what to check.

Caucus relevance must be labeled DIRECT RELEVANCE (the caucus actually works on the issue) or STRATEGIC CONNECTION (thematic overlap only). Never imply a caucus supports a bill because themes overlap. Never turn an inference into a factual claim about the member.

Cite sources inline as links so teammates can click and verify. Include `STATUS CHECKED: <today's date>` and end with the RECHECK MORNING OF MEETING list: bill status, cosponsor roster, scheduled markup, scheduled floor action, committee membership if necessary.

## Style

Structured and concise. This is Hill-meeting prep, not an academic report. Use tables wherever they improve scanning. Mark strategic judgments as recommendations, not facts. The Top-3 CTA table must be usable as a hand-off to the Advocacy Captain without further reading.
