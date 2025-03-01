# ADR [Number]: [Title of Decision]

**Status:** [Proposed | Accepted | Deprecated | Superseded by [ADR-###]]  
**Date:** [YYYY-MM-DD]  

---

## 🎯 Context
[Explain the background and the context in which this decision is being made.  
Include any relevant details about business goals, technical requirements, constraints, or assumptions.  
Example: "We need to choose a Terraform backend for state management to ensure consistency and enable team collaboration."]  

---

## 💡 Decision
[Clearly state the decision that has been made.  
Example: "We will use AWS S3 with DynamoDB for Terraform state management."]  

---

## 🧩 Rationale
[Explain the reasons for making this decision, including any alternatives considered and why they were not chosen.  
Discuss trade-offs, risks, and benefits.  
Example:  
- ✅ **Pros**: Native AWS support, cost-effective, integrates well with IAM policies.  
- ❌ **Cons**: Requires managing DynamoDB for locking.  
- 🛠 **Alternatives considered**: Terraform Cloud, GitHub Actions with encrypted artifacts.  
]  

---

## 🛣 Consequences
[Describe the consequences of this decision, both positive and negative.  
Example:  
- 📈 **Positive**: Reliable state management, team-friendly locking mechanism.  
- ⚡ **Negative**: Slightly more complex initial setup.  
]  

---

## 🔄 Alternatives
[Optional: Outline key alternatives considered in detail.  
Example: "Terraform Cloud was considered due to its ease of use but was rejected due to cost concerns for this project."]  

---

## 📝 Related ADRs
[Link to any related ADRs, if applicable.  
Example: "See ADR-0002 for decisions regarding CI/CD integration."]  
