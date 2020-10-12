# Step by Step SCALEUP-T003

In this task you are going to create a Helm chart for both the WEB and API Microservice.

## Create Helm chart

1. In your Codespace, create a new folder [**charts**] and open the folder in your terminal

    ```
    cd charts
    ```

2. To generate an empty boilerplate solution for the api application, run the following command

    ```
    helm create web-customerx
    ```

3. Open the values.yml that was generated and add the following content. Change the container name to your own GitHub account. Use as name web-customerx. This deploys a new instance of the web application side by side the already existing one.

    ```YAML
    replicaCount: 1

    image:
      repository: ghcr.io/<yourgithubaccount>/fabrikam-web
      pullPolicy: Always
      tag: "latest"

    imagePullSecrets: 
    - name: pullsecret
    nameOverride: "web-customerx"
    fullnameOverride: "web-customerx"

    serviceAccount:
      create: true
      annotations: {}
      name: ""

    podAnnotations: {}

    podSecurityContext: {}

    securityContext: {}

    service:
      type: LoadBalancer
      port: 8080

    ingress:
      enabled: false
      annotations: {}
      hosts:
        - host: chart-example.local
          paths: []
      tls: []

    resources: {}

    autoscaling:
      enabled: false
      minReplicas: 1
      maxReplicas: 100
      targetCPUUtilizationPercentage: 80
      # targetMemoryUtilizationPercentage: 80

    nodeSelector: {}

    tolerations: []

    affinity: {}

    ```

4. Update the `deployment.yaml` file to add the Environment variable to point to the API. Change the Container port to 3000, since that is the port where the web application is running

    ```YAML
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: {{ include "web-customerx.fullname" . }}
      labels:
        {{- include "web-customerx.labels" . | nindent 4 }}
    spec:
    {{- if not .Values.autoscaling.enabled }}
      replicas: {{ .Values.replicaCount }}
    {{- end }}
      selector:
        matchLabels:
          {{- include "web-customerx.selectorLabels" . | nindent 6 }}
      template:
        metadata:
        {{- with .Values.podAnnotations }}
          annotations:
            {{- toYaml . | nindent 8 }}
        {{- end }}
          labels:
            {{- include "web-customerx.selectorLabels" . | nindent 8 }}
        spec:
          {{- with .Values.imagePullSecrets }}
          imagePullSecrets:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          serviceAccountName: {{ include "web-customerx.serviceAccountName" . }}
          securityContext:
            {{- toYaml .Values.podSecurityContext | nindent 8 }}
          containers:
            - name: {{ .Chart.Name }}
              securityContext:
                {{- toYaml .Values.securityContext | nindent 12 }}
              image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
              imagePullPolicy: {{ .Values.image.pullPolicy }}
              ports:
                - name: http
                  containerPort: 3000
                  protocol: TCP
              env:
                - name: CONTENT_API_URL
                  value: http://api-customerx:8081              
              livenessProbe:
                httpGet:
                  path: /
                  port: http
              readinessProbe:
                httpGet:
                  path: /
                  port: http
              resources:
                {{- toYaml .Values.resources | nindent 12 }}
          {{- with .Values.nodeSelector }}
          nodeSelector:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          {{- with .Values.affinity }}
          affinity:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          {{- with .Values.tolerations }}
          tolerations:
            {{- toYaml . | nindent 8 }}
          {{- end }}

    ```

5. Repeat the steps 3 and 4 for the api. Call the api `api-customerx` and run the api on port 8081

    Values.yaml
    ```YAML
    replicaCount: 1

    image:
      repository: ghcr.io/renevanosnabrugge/fabrikam-api
      pullPolicy: Always
      tag: "latest"

    imagePullSecrets: 
    - name: pullsecret
    nameOverride: "api-customerx"
    fullnameOverride: "api-customerx"

    serviceAccount:
      create: true
      annotations: {}
      name: ""

    podAnnotations: {}

    podSecurityContext: {}

    securityContext: {}

    service:
      type: LoadBalancer
      port: 8081

    ingress:
      enabled: false
      annotations: {}
      hosts:
        - host: chart-example.local
          paths: []
      tls: []

    resources: {}

    autoscaling:
      enabled: false
      minReplicas: 1
      maxReplicas: 100
      targetCPUUtilizationPercentage: 80
      # targetMemoryUtilizationPercentage: 80

    nodeSelector: {}

    tolerations: []

    affinity: {}
    ```

    Deployment.yaml
    ```YAML
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: {{ include "api-customerx.fullname" . }}
      labels:
        {{- include "api-customerx.labels" . | nindent 4 }}
    spec:
    {{- if not .Values.autoscaling.enabled }}
      replicas: {{ .Values.replicaCount }}
    {{- end }}
      selector:
        matchLabels:
          {{- include "api-customerx.selectorLabels" . | nindent 6 }}
      template:
        metadata:
        {{- with .Values.podAnnotations }}
          annotations:
            {{- toYaml . | nindent 8 }}
        {{- end }}
          labels:
            {{- include "api-customerx.selectorLabels" . | nindent 8 }}
        spec:
          {{- with .Values.imagePullSecrets }}
          imagePullSecrets:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          serviceAccountName: {{ include "api-customerx.serviceAccountName" . }}
          securityContext:
            {{- toYaml .Values.podSecurityContext | nindent 8 }}
          containers:
            - name: {{ .Chart.Name }}
              securityContext:
                {{- toYaml .Values.securityContext | nindent 12 }}
              image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
              imagePullPolicy: {{ .Values.image.pullPolicy }}
              ports:
                - name: http
                  containerPort: 3001
                  protocol: TCP
              env:
                - name: MONGODB_CONNECTION
                  valueFrom:
                    secretKeyRef:
                      name: cosmosdb
                      key: db    
              livenessProbe:
                httpGet:
                  path: /
                  port: http
              readinessProbe:
                httpGet:
                  path: /
                  port: http
              resources:
                {{- toYaml .Values.resources | nindent 12 }}
          {{- with .Values.nodeSelector }}
          nodeSelector:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          {{- with .Values.affinity }}
          affinity:
            {{- toYaml . | nindent 8 }}
          {{- end }}
          {{- with .Values.tolerations }}
          tolerations:
            {{- toYaml . | nindent 8 }}
          {{- end }}
    ```

6. Now that we have created the helm charts, we can deploy the helm charts to our cluster. In the charts directory run the following command to deploy the api and web application

    ```
    helm install api-customerx api-customerx
    helm install web-customerx web-customerx
    ```

7. The web application deploys a separate Kubernetes Service to expose the site to a Public IP Address. In the previous task we set up an Ingress Controller. Open the content-ingress.yml file, and add the following snippet

    ```YAML
    - path: /customerx/(.*)
      backend:
       serviceName: web-customerx
       servicePort: 8080  
    ```

8. Apply the Ingress Controller configuration by running the command

    ```
    kubectl apply -f content-ingress.yml
    ```

9. Browse to the website `<dnsname>.region.cloudapp.azure.com/web-customerx` and see the results

> When you do not want to type all commands try the solution Pull Request by running

```
.workshop/workshop-step.ps1  Solution "SCALEUP-T003"
```

