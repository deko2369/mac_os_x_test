mac_os_x_test
========
attempt to make mac os x app without XCode

To compile:
---
`clang -Wall -fobjc-arc -o Test TestController.m main.m -framework Foundation -framework AppKit`  
or
`make`

To Run:
---
`make run`
or
`make && open Test.app`
