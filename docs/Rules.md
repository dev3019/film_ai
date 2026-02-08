# Project Rules and Constraints

This document defines the project-wide rules and constraints that must be followed during planning, development, debugging, and delivery.

## Sources and References
- Use only credible resources when citing or referring to external material.
- Acceptable sources include peer-reviewed research papers and published articles on reputable platforms (e.g., Medium, Stack Overflow, Notion).
- Avoid discussion boards such as Reddit or Quora as authoritative references.

## Engineering Standards
- Although the solution is a PoC, design, development, and testing must be done as if targeting production quality.
- Treat reliability, security, maintainability, and test coverage as first-class requirements.

## Requirements Clarity
- Ask follow-up questions when unsure about a requirement, when a suggestion appears contradictory, or when confidence is below 90%.
- Only suggest options or solutions when confidence is at least 90%.
- Do not sugarcoat; be direct and factual. If a statement from the user is incorrect, call it out clearly.

## Phased Delivery Process
- The solution will be built in three major phases. Each phase must be completed and locked before moving to the next.
- **Strict Scope:** Do not implement features or logic that were not explicitly asked for.
- **Permission-Based:** Do not start implementing/writing code until the user has explicitly given the "Go ahead" or "Implement" command. Provide plans or pseudocode first if the task is complex.

## Workflow & Git Strategy
- **Branching:** Never work directly on `main`. Always create a new feature branch from `main` before making any changes. 
- **Source of Truth:** Treat `main` as the absolute source of truth. Before starting a task, ensure the local `main` is synced with remote and branch off it.
- **Syncing:** Whenever a new chat opens or multiple models are invoked, your first action must be to verify the current branch and ensure the codebase state matches the latest accepted changes from `main` or the active feature branch.
- **Authentication** Always use ssh

## Engineering Standards
- **Style:** No sugar-coating. Be direct and concise.
- **Simplicity:** Prioritize simplicity. Avoid over-engineering.
- **Principles:** Strictly follow industry standards:
    - **DRY** (Don't Repeat Yourself)
    - **SOLID** Principles
    - **KISS** (Keep It Simple, Stupid)

## Context Synchronization
- At the start of every session or when multiple models are invoked, perform a "Context Check": Verify the current file state and Git status to ensure all models are operating on the same workspace version.

### Phase 1: High-Level Definition
- Understand the problem at a high level and clarify all requirements.
- Produce a high-level design.
- Documentation location: `docs/High-Level.md`.

### Phase 2: Low-Level Design
- Expand each requirement with detailed design and flow.
- Define interfaces/services and their contracts.
- Documentation location: `docs/Low-Level.md`.

### Phase 3: Development Plan and Execution
- Break work into smaller phases and user stories.
- Define tasks and implementation steps.
- Documentation location: `docs/Tasks.md`.

## Testing Discipline
- With each internal phase of Phase 3, add test cases to prevent regressions as new functionality is introduced.
