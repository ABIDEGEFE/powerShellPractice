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

## Lesson Two: `Get-Member`  
---

In PowerShell, **everything is treated as an object**, which means commands return structured data with properties and methods. To explore these members and understand how to interact with them, we use the `Get-Member` cmdlet.

### 🔍 Inspecting Object Members

To view all available members (properties, methods, etc.) of a specific object, pipe the output into `Get-Member`:

```powershell
Get-Process svchost | Get-Member
```

This command reveals the full list of members associated with the `svchost` process object. For example, if you notice an `Id` property, you can access it directly:

```powershell
(Get-Process svchost).Id
```

### 🔎 Discovering Related Cmdlets

The first line of the `Get-Member` output shows the object type (e.g., `System.Diagnostics.Process`). You can use this type to find related cmdlets using `Get-Command`:

```powershell
Get-Command -ParameterType Process
```

This returns all cmdlets that accept a `Process` object as a parameter.

---

## 🎯 Filtering `Get-Member` Output

Since `Get-Member` returns an object, you can filter its output using `Select-Object` to display specific columns:

```powershell
Get-Process svchost | Get-Member | Select-Object Name, MemberType
```

This displays only the `Name` and `MemberType` columns.

To filter by **row**, such as viewing only methods:

```powershell
Get-Process svchost | Get-Member -MemberType Method
```

This returns only the members classified as methods.

---


