Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "CSV Power - Visualiseur de données CSV"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"

# Mise en place de la grille de données
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Dock = "Fill" # Aligner à gauche et à droite les colonnes
$form.Controls.Add($dataGridView) # Ajouter à la fenêtre de l'application

# Ajout du bouton d'importation
$btnLoad = New-Object System.Windows.Forms.Button
$btnLoad.Text = "Importer le fichier"
$btnLoad.Font = New-Object System.Drawing.Font("Arial", 20)
$btnLoad.BackColor = [System.Drawing.Color]::Blue
$btnLoad.Dock = "Top" # Alignement en haut
$btnLoad.Height = 30 # Dimension de la hauteur en pixels
$form.Controls.Add($btnLoad)

# Action au clique sur le bouton
$btnLoad.Add_Click({
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Filter = "CSV (*.csv)|*.csv"
    $openFileDialog.Title = "Sélectionnez le fichier CSV"
    
    if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $csvPath = $openFileDialog.FileName
        try {
            $csvData = Import-Csv -Path $csvPath
            $dataGridView.DataSource = [System.Collections.Generic.List[Object]]::new($csvData)
            $dataGridView.AutoResizeColumns([System.Windows.Forms.DataGridViewAutoSizeColumnsMode]::AllCells)

        } catch {
            Write-Host "Erreur lors du chargement du fichier CSV: $_"
        }
    }
})






# Afficher la fenêtre de l'application
$form.ShowDialog()