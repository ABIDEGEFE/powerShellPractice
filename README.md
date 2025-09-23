## 📈 PowerShell Learning Journey

This repository documents my ongoing growth in PowerShell, after getting core understanding on foundational concepts such as:

- Variables and data types  
- Control flow: loops and conditional statements  
- Data structures: arrays, array lists, custom objects, dictionaries (hash tables)  
- Scripting fundamentals: functions, modules, and script organization  

As I progress, I’m capturing key lessons and practical examples to reinforce understanding and support future reference.

---

### **Lesson 1: `Get-Help` — Navigating PowerShell’s Built-In Documentation**

PowerShell includes a robust help system to explore cmdlets and their usage. The `Get-Help` cmdlet provides detailed documentation, including syntax, parameters, and examples.

#### 🔹 Basic Usage
```powershell
Get-Help -Name Set-Location
```
Returns the standard help page for the `Set-Location` cmdlet.

#### 🔹 Updating Help Files
Newer versions of PowerShell may not include help files by default. To download the latest documentation:
```powershell
Update-Help
```
This command fetches all available help files from the internet.

#### 🔹 Filtering Help Output
To retrieve specific sections of the help documentation, use flags like `-Examples`:
```powershell
Get-Help -Name Set-Location -Examples
```
This returns real-world usage examples for the specified cmdlet.

#### 🔹 Enhanced Readability with `Help`
For a line-by-line reading experience, use:
```powershell
Help Set-Location
```
Note: `Help` is not an alias for `Get-Help`. It pipes the output through a function for improved readability.

---


