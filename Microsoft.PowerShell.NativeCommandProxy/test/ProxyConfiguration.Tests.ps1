using Module Pester
using module ../src/Microsoft.PowerShell.NativeCommandProxy.psd1
Describe "Configuration based tests" {
    BeforeAll {
        $proxyObject = Import-CommandConfiguration assets/SimpleProxy.json
    }
    It "Can create a simple proxy based on the mininum configuration" {
        $proxyObject | Should -Not -BeNullOrEmpty
    }
    It "Can correctly populate the properties of the proxy command" {
        $proxyObject.Verb | Should -Be Invoke
        $proxyObject.Noun | Should -Be "thing"
        $proxyObject.OriginalName | Should -Be "/bin/app"
    }
}