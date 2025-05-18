;; Delegation Authorization Contract
;; Records permission grants

(define-map delegations
  { delegator: principal, delegate: principal }
  { active: bool, created-at: uint })

;; Error codes
(define-constant err-delegation-exists (err u200))
(define-constant err-delegation-not-found (err u201))
(define-constant err-unauthorized (err u202))

;; Create a new delegation
(define-public (create-delegation (delegate principal))
  (let ((delegation-key { delegator: tx-sender, delegate: delegate }))
    (asserts! (is-none (map-get? delegations delegation-key)) err-delegation-exists)
    (ok (map-set delegations
                delegation-key
                { active: true, created-at: block-height }))))

;; Check if a delegation exists and is active
(define-read-only (is-active-delegation (delegator principal) (delegate principal))
  (match (map-get? delegations { delegator: delegator, delegate: delegate })
    delegation (get active delegation)
    false))

;; Revoke a delegation (can only be done by the delegator)
(define-public (revoke-delegation (delegate principal))
  (let ((delegation-key { delegator: tx-sender, delegate: delegate }))
    (match (map-get? delegations delegation-key)
      delegation (ok (map-set delegations
                            delegation-key
                            (merge delegation { active: false })))
      (err err-delegation-not-found))))
