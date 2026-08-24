# Tool Routing Matrix

Generated: 2026-06-29 18:57:20 -04:00

| Tool | Purpose | Best Use | Should Not Do | Approved Working Folders | Read First | Never Touch | Logging |
|---|---|---|---|---|---|---|---|
| Codex | Code work, scripts, repo review, app building, GaryOS file generation, structured technical improvements, safe automation | Local technical execution inside approved folders | Modify security settings, credentials, production config, or client files without approval | Documents/GaryOS, Documents/Projects, Documents/Projects/Sandbox | AGENTS.md, GaryOS_Master_Instructions.md, Machine_Profile.md | Secrets, tokens, API keys, production data | Improvement loop and release notes |
| Claude Code | Deep codebase review, refactoring, architecture review, documentation review, larger reasoning | Larger project reasoning after boundaries are clear | Bypass GaryOS rules or change risky files automatically | Approved project folders | CLAUDE.md, AGENTS.md, project README | Secrets, production config, client raw data | Findings and decision logs |
| Cursor | Assisted code editing, navigation, project review, developer workflow | Active code edits in known repos | Edit outside approved projects | Documents/Projects | Project rules, README, TASKS | Secrets and tool config | Project notes and issue log |
| Antigravity | Browser testing, visual review, UI inspection, local preview, lab work | Web app testing | Eager host execution without review | Documents/Projects/Sandbox | Test plan and app README | Security settings and credentials | Test log |
| Desktop Commander | Controlled local file review, organization planning, GaryOS maintenance, local execution | File inventory and safe local execution | Broad changes without approval | Documents/GaryOS, Documents/Projects/Sandbox | Machine audit and approval queue | Secrets, system folders, production data | Audit reports |
| Graphify | Project mapping and codebase context | Repo mapping before changes | Replace project instructions | Documents/Projects | Project README, CLAUDE.md | Secrets and generated caches | System maps |
| OpenPaw | Hooks and safety checks when configured | Safety checks and context | Bypass GaryOS operating rules | Configured approved folders | SOUL.md, memory files if present | Credentials and private client data | Hook findings |
| ChatGPT | Strategy, executive writing, decision support, meeting prep, proposal language, prompt design, high level review | Review safe GaryOS context exports | Assume current local facts without refresh | Safe pasted context only | GaryOS_Context_For_ChatGPT.md | Secrets and raw client data | Decisions and open loops |
