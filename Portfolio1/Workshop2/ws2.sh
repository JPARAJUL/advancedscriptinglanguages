#!/bin/bash
#CSG6206 – Advanced Scripting
#Workshop 2 – System Information and String Formatting
#Jeewan Parajuli(10436478)

dashBorder3=$(printf -- '-%.0s' {0..30})
echo "${dashBorder3// /-} System Report ${dashBorder3// /-}" >>output.txt


dashBorder2=$(printf -- '-%.0s' {0..76})
echo "${dashBorder2// /-}" >>output.txt

dashBorder3=$(printf -- '-%.0s' {0..31})
echo "${dashBorder3// /-}  End Report ${dashBorder3// /-}" >>output.txt

