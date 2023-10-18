# aks-chaos-engineer
Azure Kubernetes Service using Chaos Studio

<br><b> This repository houses the uses of Azure Kubernetes Service with use of Helm for Chaos Studio require some pre-requisites</b></br>

<br><b>Reference Architecture</b></br>
<img src='https://github.com/sn0rlaxlife/aks-chaos-engineer/blob/main/Azure%20Kubernetes%20with%20Prometheus%20(1).png'></img>

<br><p>For the uses of this repository ensure you have registered for this preview via the following commands</p></br>


<p>For credentials ensure you have these as environment variables to deploy....</p>
<b>Clone the repository</b>
<pre class="no translate">
   <code>git clone https://github.com/sn0rlaxlife/aks-chaos-engineer.git </code>
</pre>

<pre class="no translate">
  <code>export ARM_SUBSCRIPTION_ID</code>
  <code>export ARM_CLIENT_ID</code>
  <code>export ARM_CLIENT_SECRET</code>
  <code>export ARM_TENANT_ID</code>
<p>Run initialization</p>
<pre class="no translate">
  <code>cd aks-chaos-engineer</code>
  <code>terraform init</code>
  <code>terraform plan</code>
  <code>terraform apply --auto-approve</code>
</pre>

<p>Ensure you have the Azure CLI to use the following command either locally/on Cloud Shell</p>
<pre class="no translate">
  <code>az account set --subscription <subscription-id></code>
  <code>az aks get-credentials --resource-group aks-chaos-mesh-rg --name aks-chaos-mesh-aks</code>
</pre>

  <code>cd chaosmesh</code>
  <code>terraform init</code>
  <code>terraform plan</code>
  <code>terraform apply --auto-approve</code>




