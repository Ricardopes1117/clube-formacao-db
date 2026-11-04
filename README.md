# Football Academy Database ⚽

An academic relational database project for managing the activities of a youth football academy, developed using **Microsoft SQL Server** and **T-SQL**.

## Overview

The database supports the management of players, coaches, age groups, sporting seasons, registrations, training sessions, attendance, fees and payments.

## Main features

- Relational data model with primary and foreign keys
- Player registration and sporting-season management
- Training sessions and attendance tracking
- Fee and payment monitoring
- SQL views for reporting and operational analysis
- Stored procedures for common management operations

## Technologies

- Microsoft SQL Server
- Transact-SQL (T-SQL)
- SQL Server Management Studio (SSMS)

## Repository structure

```text
clube-formacao-db/
├── sql/
│   └── ClubeFormacaoDB.sql
├── docs/
│   └── Relatorio_BD.pdf
├── .gitignore
└── README.md
```

## Setup

1. Open SQL Server Management Studio and connect to a SQL Server instance.
2. Open `sql/ClubeFormacaoDB.sql`.
3. Review the script and execute it on a development instance where the database `ClubeFormacaoDB` does not already exist.

**Note:** The script was exported from SQL Server 2025 and includes server-version-specific settings. It has not yet been validated on a fresh SQL Server instance. The export includes the database schema, not its original records.

## Academic context

Developed as a group assignment in the Database course at ESTG, Polytechnic Institute of Porto.

*Academic group project.*
