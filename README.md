# Tokenized Digital Identity Delegation System

This project implements a tokenized digital identity delegation system using Clarity smart contracts. It allows users to delegate their digital identity to other entities with specific scopes, time constraints, and revocation capabilities.

## Components

### 1. Identity Provider Verification
The `identity-provider.clar` contract validates credential issuers by maintaining a registry of verified identity providers. Only verified providers can issue credentials that are accepted by the system.

### 2. Delegation Authorization
The `delegation-authorization.clar` contract records permission grants between delegators and delegates. It maintains the state of active delegations.

### 3. Scope Limitation
The `scope-limitation.clar` contract defines boundaries of delegated authority by allowing delegators to specify which actions a delegate can perform on their behalf.

### 4. Temporal Constraint
The `temporal-constraint.clar` contract manages time-limited permissions by setting expiration times for delegations.

### 5. Revocation
The `revocation.clar` contract handles termination of delegated rights, allowing delegators to revoke permissions with a specified reason.

## Usage

### Creating a Delegation

1. Verify that the identity provider is trusted using the `identity-provider` contract.
2. Create a delegation using the `delegation-authorization` contract.
3. Set the scope of the delegation using the `scope-limitation` contract.
4. Set an expiration time using the `temporal-constraint` contract.

### Revoking a Delegation

Use the `revocation` contract to revoke a delegation with a specified reason.

### Checking Delegation Validity

Use the `is-valid-delegation` function in the `temporal-constraint` contract to check if a delegation is both active and not expired.

## Testing

Tests are written using Vitest and can be found in the `tests` directory.

## License

[Specify your license here]
