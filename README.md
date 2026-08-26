# Software Architecture Playbook

A practical, hands-on journey from software design fundamentals to enterprise-level solution architecture in Flutter & Dart.

This repository explores the principles, patterns, and architectural approaches used to design scalable, maintainable, secure, and production-ready software systems.

The goal is not to collect definitions or isolated code examples, but to understand the reasoning behind architectural decisions — when to use an approach, when not to use it, and what trade-offs it introduces.

---

## 📚 Table of Contents & Status

### 1. Software Design Principles
- [x] **SOLID Principles**
  - [x] 🟢 **[Single Responsibility Principle (SRP)](lib/principles/srp/README.md)** — *God Object vs Modular Services & Reusability*
  - [ ] 🟡 Open/Closed Principle (OCP) *(Coming Soon)*
  - [ ] 🟡 Liskov Substitution Principle (LSP) *(Coming Soon)*
  - [ ] 🟡 Interface Segregation Principle (ISP) *(Coming Soon)*
  - [ ] 🟡 Dependency Inversion Principle (DIP) *(Coming Soon)*
- [ ] Separation of Concerns
- [ ] Encapsulation
- [ ] Cohesion and Coupling
- [ ] Composition over Inheritance

### 2. Design Patterns
- [ ] Creational Patterns (Factory Method, Abstract Factory, Singleton, Builder, Prototype)
- [ ] Structural Patterns (Adapter, Decorator, Facade, Composite, Proxy)
- [ ] Behavioral Patterns (Observer, Strategy, Command, State, Chain of Responsibility)

### 3. Low-Level Design (LLD)
- [ ] Object-oriented design & Domain modeling
- [ ] Class and interface design
- [ ] Extensibility and maintainability
- [ ] Design reviews

### 4. High-Level Design (HLD)
- [ ] System decomposition & Service boundaries
- [ ] API design (REST, gRPC, GraphQL)
- [ ] Data architecture, Scalability & Caching
- [ ] Messaging and asynchronous processing

### 5. Software Architecture
- [ ] Layered Architecture
- [ ] Clean Architecture
- [ ] Hexagonal / Ports & Adapters Architecture
- [ ] Modular Architecture & Feature-Driven Design
- [ ] Event-driven architecture

### 6. Enterprise Concerns
- [ ] Distributed systems & Cloud architecture
- [ ] Security, Performance & Observability
- [ ] Fault tolerance, Resilience & Disaster recovery

---

## 📁 Repository Structure

```text
software-architecture-playbook/
├── lib/
│   └── principles/
│       ├── export.dart
│       └── srp/                            # Single Responsibility Principle Module
│           ├── violation/                  # Anti-pattern: Monolithic "God Objects"
│           └── refactored/                 # Clean Architecture: Single Responsibility Services
│           ├── README.md                   # SRP Detailed Architectural Guide & Diagrams      
│           ├── refactored_export.dart
│           ├── violation_export.dart
├── test/
│   └── principles/
│       └── srp_test.dart                   # Isolated Unit Tests for SRP
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started & Running Tests

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) / Dart SDK (version 3.0+)

### Running Static Analysis
Validate code health and lint compliance:
```bash
dart analyze
```

### Running Unit Tests
Execute the unit test suite to verify principle implementations:
```bash
dart test
```

---

## 💡 Case Studies Roadmap

The concepts are applied together in realistic mobile & backend case studies:

```text
SOLID Principles
       +
Design Patterns
       +
Low-Level Design (LLD)
       +
High-Level Design (HLD)
       +
Security & Scalability
       ↓
Enterprise Case Study
```# software-architecture-playbook
