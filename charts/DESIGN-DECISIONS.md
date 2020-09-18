# Design Decisions

Sub chart for each container
==================================

- more flexibility
- less requirement for nested vars
- convenience for partner deployments
- sub charts can be extracted easily and managed as seperate repositories if required.

Seperate Secrets file for each deployment with same values
============================================================

- Each subcart is independant , ie no global secrets chart required.
- Each subchart may require its own secrets in the future.
