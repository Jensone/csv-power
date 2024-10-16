# CSV Power

Une application web pour visualiser les données de la base de données CSV.

# Les classes

Pour cette application nous avons besoin des classes suivantes `Forms` et `Drawing`.

Au début du fichier du programme, on les importe comme suit :

```powershell
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
```

# Création de la fenêtre

Pour créer la fenêtre, on utilise la classe `Form` et on lui donne un titre, sa taille et sa position.

```powershell
$form = New-Object System.Windows.Forms.Form
$form.Text = "CSV Power - Visualiseur de données CSV"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"
```

## Mise en place de la grille de données

```powershell
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Dock = "Fill"
$form.Controls.Add($dataGridView) # Ajouter à la fenêtre de l'application
```

`.Dock` permet de positionner le tableau de données à gauche et à droite.
`.Controls.Add($dataGridView)` ajoute le tableau de données à la fenêtre.

## Ajout du bouton d'importation