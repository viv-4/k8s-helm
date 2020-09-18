apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: {{ .Values.podPriorities.highClassName }}
value: 1000000
globalDefault: false
description: "This priority class should be used for XYZ service pods only."
---
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: {{ .Values.podPriorities.mediumClassName }}
value: 100000
globalDefault: false
description: "This priority class should be used for XYZ service pods only."