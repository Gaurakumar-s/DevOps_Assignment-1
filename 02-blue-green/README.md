# Blue-Green Deployment Strategy

## What is Blue-Green Deployment?

Blue-Green Deployment is a release strategy where you maintain two identical production environments running side-by-side at all times — called **Blue** (current live version) and **Green** (new version being prepared).

* **Blue** = Current production environment. Serving 100% of live user traffic.
* **Green** = New version environment. Fully deployed and tested, but receiving zero user traffic.

When you are confident the Green environment is healthy and tested, you flip a single switch (a Kubernetes Service selector change) to redirect 100% of traffic from Blue to Green — instantaneously.

```text
PHASE 1: Normal Operation
  Users ------> [Service] ------> [BLUE: v1] [BLUE: v1] [BLUE: v1]  (LIVE)
                                  [GREEN: v2] [GREEN: v2] [GREEN: v2] (IDLE - warming up)

PHASE 2: Flip the Switch (kubectl apply -f service-green.yaml)
  Users ------> [Service] ------> [GREEN: v2] [GREEN: v2] [GREEN: v2] (NOW LIVE)
                                  [BLUE: v1]  [BLUE: v1]  [BLUE: v1]  (STANDBY - instant rollback)

PHASE 3: Rollback (if needed) — just flip back
  Users ------> [Service] ------> [BLUE: v1]  (Back to v1 in under 5 seconds)
```

---

## Why Do We Need Blue-Green?

### Problems with Rolling Update:
* During a rolling update, both v1 and v2 pods are simultaneously serving traffic. If v2 has a database schema migration incompatible with v1, mixed traffic causes data corruption.
* You cannot do pre-production load testing on the new version with zero user impact.

### Benefits of Blue-Green:
* **Instant cutover**: The switch from v1 to v2 takes under 5 seconds.
* **Instant rollback**: If v2 has a bug, flip the selector back. Rollback takes under 5 seconds.
* **Pre-production testing under production conditions**: Green runs full load tests in the real cluster before receiving user traffic.
* **No mixed traffic**: At any point, 100% of users are on v1 OR 100% are on v2. Never both.

---

## Important Points
* Blue-Green requires **2x the compute resources** (double the pods running simultaneously).
* The **only** thing that changes between Blue and Green is the `selector` field in the Service manifest (`slot: blue` vs `slot: green`).
* Keep the Blue environment running for at least 24 hours after switching to Green as your instant rollback safety net.
* After a successful Green deployment and stability period, recycle Blue pods to save resource costs.

---

## Code Files
| File | Purpose |
| :--- | :--- |
| `deployment-blue.yaml` | 3 pods of v1 (blue background) — initially LIVE |
| `deployment-green.yaml` | 3 pods of v2 (green background) — initially STANDBY |
| `service-blue.yaml` | Service with selector: `slot: blue` — routes to v1 |
| `service-green.yaml` | Service with selector: `slot: green` — routes to v2 |

---

## Step-by-Step Commands

### Step 1: Deploy Both Environments Simultaneously
```bash
kubectl apply -f deployment-blue.yaml
kubectl apply -f deployment-green.yaml
```

Check all 6 pods (3 blue, 3 green):
```bash
kubectl get pods -l app=myapp --show-labels
```

### Step 2: Point Service to BLUE (v1 goes LIVE)
```bash
kubectl apply -f service-blue.yaml
minikube service myapp-service
```

### Step 3: Inspect Service Selector & Endpoints
```bash
kubectl describe svc myapp-service | grep Selector
kubectl get endpoints myapp-service
```

### Step 4: THE SWITCH — Flip 100% Traffic to GREEN (v2) Instantly
```bash
kubectl apply -f service-green.yaml
```

### Step 5: Verify Endpoints Changed
```bash
kubectl describe svc myapp-service | grep Selector
kubectl get endpoints myapp-service
```

### Step 6: Rollback — Flip Back to Blue in Under 5 Seconds
```bash
kubectl apply -f service-blue.yaml
```

### Step 7: Decommission Old Blue Environment
```bash
kubectl delete deployment app-blue
```

---

## Cleanup
```bash
kubectl delete -f service-blue.yaml
kubectl delete -f deployment-blue.yaml
kubectl delete -f deployment-green.yaml
```
