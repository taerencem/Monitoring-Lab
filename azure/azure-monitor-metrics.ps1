param(
    [string]$VMName,
    [string]$RG
)

az monitor metrics list `
  --resource "/subscriptions/<SUB-ID>/resourceGroups/$RG/providers/Microsoft.Compute/virtualMachines/$VMName" `
  --metric "Percentage CPU" `
  --output json > ../examples/azure-monitor-output.json
