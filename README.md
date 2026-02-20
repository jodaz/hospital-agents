**Project Overview**

- **Name:** Hospital Agents — a small repo of agent personalities and operational knowledge for "Hospital Premium Carúpano".
- **Purpose:** Store human-curated agent instructions (SOUL) and lookup knowledge used to run, audit, and train conversational concierge and evaluation agents.

**Repository Structure**

- **ceo:** [ceo/SOUL.md](ceo/SOUL.md) — Strategic executive agent; produces short executive memoranda and detects systemic issues.
- **coo:** [coo/SOUL.md](coo/SOUL.md) — Quality / Experience auditor; evaluates transcripts and emits JSON reports.
- **receptionist:** [receptionist/SOUL.md](receptionist/SOUL.md) and [receptionist/KNOWLEDGE.md](receptionist/KNOWLEDGE.md) — Concierge persona and operational facts (hours, prices, prep instructions).
- **logs:** Conversation transcripts, corrected chats and audit reports (e.g. [logs/chat_corrected_002.txt](logs/chat_corrected_002.txt), [logs/report_001.json](logs/report_001.json)).

**How to Use**

- **Inspect agent personalities:** Open the `SOUL.md` files to see each agent's mission, tone and rules. Examples: [ceo/SOUL.md](ceo/SOUL.md), [receptionist/SOUL.md](receptionist/SOUL.md).
- **Operational facts:** The receptionist should reference [receptionist/KNOWLEDGE.md](receptionist/KNOWLEDGE.md) for accurate hours, prices and prep instructions.
- **COO audit output:** The COO expects a JSON report with fields: `score`, `tone_analysis`, `critical_errors`, `improvement_feedback` (see [coo/SOUL.md](coo/SOUL.md)).

**Recommended Workflow**

- Create or adapt a conversational agent that reads the relevant `SOUL.md` for persona rules and `KNOWLEDGE.md` for factual answers.
- Run audits by feeding chat transcripts from `logs/` into the COO agent; store the JSON audit results back into `logs/`.

**Contributing**

- **Add or update agent guidance:** Edit the relevant `SOUL.md` file and keep changes concise and imperative.
- **Update facts:** Change `receptionist/KNOWLEDGE.md` when hours, prices or contacts change.
- **Logs & Reports:** Keep `logs/` as the source of truth for transcripts and audit outputs.

**Logs & Data**

- Example audit and transcripts: [logs/report_001.json](logs/report_001.json), [logs/chat_corrected_002.txt](logs/chat_corrected_002.txt).

**Contact / Owner**

- Owner: Jesús (project workspace). For policy/strategy decisions, consult the `ceo/SOUL.md` guidance.

**License**

- No license file included. Add a `LICENSE` if you intend to publish this project.

**Quick Tip**

- When implementing agents, treat `SOUL.md` as the authoritative persona specification and `KNOWLEDGE.md` as the single source of truth for operational facts.
