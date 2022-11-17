# https://github.com/Chainski/PowerShell-Compile-Csharp
# Simple Hello World Program in C# :)


$source  = @" 
using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Windows.Forms;
 
namespace Chainski
{
    public class Program
    {
        public static void Main()
        {
           MessageBox.Show("Hello, World !");
        }
    }
}
"@
$outpath  =  "$env:userprofile\downloads\hello.exe" 
$dict = new-object 'System.Collections.Generic.Dictionary[string,string]' 
$dict.Add('CompilerVersion','v4.0')
$CsharpCompiler = New-Object Microsoft.CSharp.CSharpCodeProvider $dict
$CompilerParametres = New-Object System.CodeDom.Compiler.CompilerParameters
$CompilerParametres.ReferencedAssemblies.Add("System.dll")
$CompilerParametres.ReferencedAssemblies.Add("System.Windows.Forms.dll")
$CompilerParametres.IncludeDebugInformation = $false
$CompilerParametres.GenerateExecutable = $true
$CompilerParametres.GenerateInMemory = $false
$CompilerParametres.OutputAssembly  =  $outpath 
$CompilerParametres.CompilerOptions += "/platform:X86 /unsafe /target:winexe"
$result = $CsharpCompiler.CompileAssemblyFromSource($CompilerParametres, $source) 
$result  
 
